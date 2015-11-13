//
//  BackgroundDownloader.swift
//  TwentyOne
//
//  Created by Greg Fiumara on 11/11/15.
//  Copyright © 2015 Greg Fiumara. All rights reserved.
//

import UIKit

public class BackgroundDownloader: NSObject, NSURLSessionTaskDelegate, NSURLSessionDownloadDelegate
{
	var completionHandler:(UIBackgroundFetchResult) -> Void

	public init(completionHandler:(UIBackgroundFetchResult) -> Void)
	{
		self.completionHandler = completionHandler
	}

	public func updateBlockList()
	{
		Logger.log("Beginning background download...");

		let configuration = NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier(Constants.BackgroundSessionID)
		configuration.sessionSendsLaunchEvents = true
		configuration.sharedContainerIdentifier = Constants.AppGroupID

		let session = NSURLSession.init(configuration:configuration, delegate:self, delegateQueue:nil)
		let downloadTask = session.downloadTaskWithRequest(NSURLRequest.init(URL:Constants.BlockListURL))
		downloadTask.resume()
	}

	public func URLSession(session:NSURLSession, task:NSURLSessionTask, didCompleteWithError error:NSError?)
	{
		if error != nil {
			self.completionHandler(.Failed)
		}
	}

	public func URLSession(session:NSURLSession, downloadTask:NSURLSessionDownloadTask, didFinishDownloadingToURL temporaryURL:NSURL)
	{
		Logger.log("Finished downloading");
		let newData = NSData.init(contentsOfURL:temporaryURL)

		/* See if block list has changed */
		var uncoordinatedURL = NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier(Constants.AppGroupID)!;
		uncoordinatedURL = uncoordinatedURL.URLByAppendingPathComponent(Constants.BlockListFilename)
		let fileCoordinator = NSFileCoordinator.init(filePresenter:nil)
		var error:NSError?
		var operationDidFinish:Bool = false
		var theSame = false
		fileCoordinator.coordinateReadingItemAtURL(uncoordinatedURL, options:.ResolvesSymbolicLink, error:&error, byAccessor:{(readingURL) in
			let oldData = NSData.init(contentsOfURL:readingURL)
			theSame = (oldData == newData)
			operationDidFinish = true
		});

		if error != nil {
			Logger.log("ERROR (comparing data): \(error)")
			self.completionHandler(.Failed)
			return
		}

		if operationDidFinish != true {
			Logger.log("ERROR (comparing data): Operation did not finish")
			self.completionHandler(.Failed)
			return
		}

		if (theSame) {
			Logger.log("Data was the same, not re-writing")
			self.completionHandler(.NoData)
		} else {
			Logger.log("Data was different, writing")
			BackgroundDownloader.saveBlockListWithData(newData)
			self.completionHandler(.NewData)
		}
	}

	private static func saveBlockListWithData(data:NSData?)
	{
		if data == nil {
			Logger.log("ERROR (saving file): data was nil")
			return
		}

		let fileCoordinator = NSFileCoordinator.init(filePresenter:nil)
		var uncoordinatedURL = NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier(Constants.AppGroupID)!;
		uncoordinatedURL = uncoordinatedURL.URLByAppendingPathComponent(Constants.BlockListFilename)
		var error:NSError?
		var operationDidFinish:Bool = false
		fileCoordinator.coordinateWritingItemAtURL(uncoordinatedURL, options:.ForReplacing, error:&error, byAccessor:{(writingURL) in
			let fileManager = NSFileManager.defaultManager()
			if fileManager.fileExistsAtPath(writingURL.path!) {
				do {
					try fileManager.replaceItemAtURL(writingURL, withItemAtURL:uncoordinatedURL, backupItemName:nil, options:.UsingNewMetadataOnly, resultingItemURL:nil)
				}
				catch let error as NSError {
					operationDidFinish = false
					Logger.log("ERROR: \(error.localizedDescription)")
				}
			} else {
				operationDidFinish = data!.writeToURL(writingURL, atomically:true)
			}
		})

		if error != nil {
			Logger.log("ERROR (saving file): \(error?.localizedDescription)")
			return
		}

		if operationDidFinish != true {
			Logger.log("ERROR (saving file): Operation did not complete successfully")
			return
		}
	}
}
