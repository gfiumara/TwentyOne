//
//  BlockListUpdater.swift
//  TwentyOne
//
//  Created by Greg Fiumara on 11/13/15.
//  Copyright © 2015 Greg Fiumara. All rights reserved.
//

import SafariServices
import UIKit

public struct BlockListUpdater
{
	public static func saveAndRecompileNewBlockListData(data:NSData, completionHandler:((UIBackgroundFetchResult) -> Void)?)
	{
		let dataString = NSString.init(data:data, encoding:NSUTF8StringEncoding)
		if dataString == nil {
			Logger.log("Newly downloaded data string was nil")
			if completionHandler != nil {
				completionHandler!(.Failed)
			}
			return
		}

		let currentDateAndTime = NSDate.init()
		let defaults = NSUserDefaults.init(suiteName:Constants.AppGroupID)
		defaults?.setObject(currentDateAndTime, forKey:Constants.BlockerListRetrievedDateKey)

		var dataIsNew = false
		if defaults?.objectForKey(Constants.BlockerListNameKey) == nil {
			Logger.log("No previous block list found. Storing new block list.")
			defaults?.setObject(dataString, forKey:Constants.BlockerListNameKey)
			defaults?.synchronize()
			dataIsNew = true
		} else {
			let oldString:NSString? = defaults?.objectForKey(Constants.BlockerListNameKey) as! NSString?
			if oldString != dataString {
				Logger.log("Data is new, saving.")
				defaults?.setObject(dataString, forKey:Constants.BlockerListNameKey)
				defaults?.synchronize()
				dataIsNew = true
			} else {
				Logger.log("Downloaded data was the same")
				dataIsNew = false
			}
		}

		/* Rebuild and return to application delegate */
		Logger.log("Rebuilding blocker rules...")
		SFContentBlockerManager.reloadContentBlockerWithIdentifier(Constants.ContentBlockerBundleID, completionHandler:{(error) -> Void in
			if error == nil {
				Logger.log("Rebuild was successful")
			} else {
				Logger.log("ERROR (rebuilding rules): \(error?.debugDescription)")
			}

			if dataIsNew {
				defaults?.setObject(currentDateAndTime, forKey:Constants.BlockerListUpdatedDateKey)
				if (completionHandler != nil) {
					completionHandler!(.NewData)
				}
			} else {
				if (completionHandler != nil) {
					completionHandler!(.NoData);
				}
			}
		})

	}
}