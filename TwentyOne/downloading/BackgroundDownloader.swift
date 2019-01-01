/*
 * BackgroundDownloader.swift
 * Part of https://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */


import SafariServices
import UIKit

open class BackgroundDownloader: NSObject, URLSessionTaskDelegate, URLSessionDownloadDelegate
{
	var completionHandler:(UIBackgroundFetchResult) -> Void

	public init(completionHandler:@escaping (UIBackgroundFetchResult) -> Void)
	{
		self.completionHandler = completionHandler
	}

	open func updateBlockList()
	{
		Logger.log("Beginning background download...");

		let configuration = URLSessionConfiguration.background(withIdentifier: Constants.BackgroundSessionID)
		configuration.sessionSendsLaunchEvents = true
		configuration.sharedContainerIdentifier = Constants.AppGroupID

		let session = Foundation.URLSession.init(configuration:configuration, delegate:self, delegateQueue:nil)
		let downloadTask = session.downloadTask(with: URLRequest.init(url:Constants.BlockListURL as URL))
		downloadTask.resume()
	}

	open func urlSession(_ session:URLSession, task:URLSessionTask, didCompleteWithError error:Error?)
	{
		if error != nil {
			self.completionHandler(.failed)
		}
	}

	open func urlSession(_ session:URLSession, downloadTask:URLSessionDownloadTask, didFinishDownloadingTo temporaryURL:URL)
	{
		Logger.log("Finished downloading");
		let newData = try? Data.init(contentsOf: temporaryURL)
		if newData == nil {
			Logger.log("Newly downloaded data was nil")
			self.completionHandler(.failed)
			return
		}

		BlockListUpdater.saveAndRecompileNewBlockListData(newData!, completionHandler:self.completionHandler)
	}
}
