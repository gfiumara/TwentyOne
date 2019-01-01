/*
 * ForegroundDownloader.swift
 * Part of http://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import Foundation

struct ForegroundDownloader
{
	static func updateBlocklist(_ success:((_ data:Data, _ response:HTTPURLResponse) -> Void)?, failure:((_ error:NSError, _ response:HTTPURLResponse) -> Void)?)
	{
		Logger.log("Downloading block list updates in the foreground...")
		let session = URLSession.init(configuration:URLSessionConfiguration.default)
		session.dataTask(with: Constants.BlockListURL, completionHandler:{(data, response, error) in
			let defaults = UserDefaults.init(suiteName:Constants.AppGroupID)
			defaults?.set(Date.init(), forKey:Constants.BlockerListRetrievedDateKey)

			if error != nil {
				if failure != nil {
					failure!(error! as NSError, response as! HTTPURLResponse)
				}
				return
			}

			if data == nil {
				if failure != nil {
					failure!(NSError.init(domain:NSURLErrorDomain, code:NSURLErrorCannotDecodeContentData, userInfo:nil), response as! HTTPURLResponse)
				}
				return
			}

			if success != nil {
				success!(data!, response as! HTTPURLResponse)
			}
		}).resume()
	}
}
