/*
 * BlockListUpdater.swift
 * Part of https://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import SafariServices
import UIKit

public struct BlockListUpdater
{
	public static func saveAndRecompileNewBlockListData(_ data:Data, completionHandler:((UIBackgroundFetchResult) -> Void)?)
	{
		let dataString = NSString.init(data:data, encoding:String.Encoding.utf8.rawValue)
		if dataString == nil {
			Logger.log("Newly downloaded data string was nil")
			if completionHandler != nil {
				completionHandler!(.failed)
			}
			return
		}

		let currentDateAndTime = Date.init()
		let defaults = UserDefaults.init(suiteName:Constants.AppGroupID)
		defaults?.set(currentDateAndTime, forKey:Constants.BlockerListRetrievedDateKey)

		var dataIsNew = false
		if defaults?.object(forKey: Constants.BlockerListNameKey) == nil {
			Logger.log("No previous block list found. Storing new block list.")
			defaults?.set(dataString, forKey:Constants.BlockerListNameKey)
			defaults?.synchronize()
			dataIsNew = true
		} else {
			let oldString:NSString? = defaults?.object(forKey: Constants.BlockerListNameKey) as! NSString?
			if oldString != dataString {
				Logger.log("Data is new, saving.")
				defaults?.set(dataString, forKey:Constants.BlockerListNameKey)
				defaults?.synchronize()
				dataIsNew = true
			} else {
				Logger.log("Downloaded data was the same")
				dataIsNew = false
			}
		}

		/* Rebuild and return to application delegate */
		Logger.log("Rebuilding blocker rules...")
		SFContentBlockerManager.reloadContentBlocker(withIdentifier: Constants.ContentBlockerBundleID, completionHandler:{(error) -> Void in
			if error == nil {
				Logger.log("Rebuild was successful")
			} else {
				Logger.log("ERROR (rebuilding rules): \(String(describing:error))")
			}

			if dataIsNew {
				defaults?.set(currentDateAndTime, forKey:Constants.BlockerListUpdatedDateKey)
				if (completionHandler != nil) {
					completionHandler!(.newData)
				}
			} else {
				if (completionHandler != nil) {
					completionHandler!(.noData);
				}
			}
		})

	}
}
