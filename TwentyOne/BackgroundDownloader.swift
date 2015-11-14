//
//  BackgroundDownloader.swift
//  TwentyOne
//
//  Created by Greg Fiumara on 11/11/15.
//  Copyright © 2015 Greg Fiumara. All rights reserved.
//

import SafariServices
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
		if newData == nil {
			Logger.log("Newly downloaded data was nil")
			self.completionHandler(.Failed)
			return
		}

		let newDataString = NSString.init(data:newData!, encoding:NSUTF8StringEncoding)
		if newDataString == nil {
			Logger.log("Newly downloaded data string was nil")
			self.completionHandler(.Failed)
			return
		}

		var dataIsNew = false
		let defaults = NSUserDefaults.init(suiteName:Constants.AppGroupID)
		if defaults?.objectForKey(Constants.BlockerListKey) == nil {
			Logger.log("No previous block list found. Storing new block list.")
			defaults?.setObject(newDataString, forKey:Constants.BlockerListKey)
			defaults?.synchronize()
			dataIsNew = true
		} else {
			let oldString:NSString? = defaults?.objectForKey(Constants.BlockerListKey) as! NSString?
			if oldString != newDataString {
				Logger.log("Data is new, saving.")
				defaults?.setObject(newDataString, forKey:Constants.BlockerListKey)
				defaults?.synchronize()
				dataIsNew = true
			} else {
				Logger.log("Downloaded data was the same")
				dataIsNew = false
			}
		}

		/* Rebuild and return to application delegate */
		if dataIsNew {
			Logger.log("Rebuilding blocker rules")
			SFContentBlockerManager.reloadContentBlockerWithIdentifier(Constants.ContentBlockerBundleID, completionHandler:{(error) -> Void in
				if error == nil {
					Logger.log("Rebuild was successful")
				} else {
					Logger.log("ERROR (rebuilding rules): \(error?.debugDescription)")
				}
				self.completionHandler(.NewData)
			})
		} else {
			self.completionHandler(.NoData)
		}
	}
}
