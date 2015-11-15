/*
 * ForegroundDownloader.swift
 * Part of http://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import Foundation

struct ForegroundDownloader
{
	static func updateBlocklist(success:((data:NSData, response:NSHTTPURLResponse) -> Void)?, failure:((error:NSError, response:NSHTTPURLResponse) -> Void)?)
	{
		Logger.log("Downloading block list updates in the foreground...")
		let session = NSURLSession.init(configuration:NSURLSessionConfiguration.defaultSessionConfiguration())
		session.dataTaskWithURL(Constants.BlockListURL, completionHandler:{(data, response, error) in
			let defaults = NSUserDefaults.init(suiteName:Constants.AppGroupID)
			defaults?.setObject(NSDate.init(), forKey:Constants.BlockerListRetrievedDateKey)

			if error != nil {
				if failure != nil {
					failure!(error:error!, response:response as! NSHTTPURLResponse!)
				}
				return
			}

			if data == nil {
				if failure != nil {
					failure!(error:NSError.init(domain:NSURLErrorDomain, code:NSURLErrorCannotDecodeContentData, userInfo:nil), response:response as! NSHTTPURLResponse!)
				}
				return
			}

			if success != nil {
				success!(data:data!, response:response as! NSHTTPURLResponse!)
			}
		}).resume()
	}
}