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
		if NSString.init(data:data, encoding:String.Encoding.utf8.rawValue) == nil {
			Logger.log("Newly downloaded data string was nil")
			completionHandler?(.failed)
			return
		}

		guard let fileURL = Constants.BlockerListFileURL else {
			Logger.log("Could not resolve shared App Group container URL")
			completionHandler?(.failed)
			return
		}

		let currentDateAndTime = Date.init()
		let defaults = UserDefaults.init(suiteName:Constants.AppGroupID)
		defaults?.set(currentDateAndTime, forKey:Constants.BlockerListRetrievedDateKey)

		let oldData = try? Data.init(contentsOf:fileURL)
		let dataIsNew = oldData != data

		if dataIsNew {
			Logger.log("Data is new, saving.")
			do {
				try data.write(to:fileURL, options:.atomic)
			} catch {
				Logger.log("ERROR (writing block list file): \(error.localizedDescription)")
				completionHandler?(.failed)
				return
			}
		} else {
			Logger.log("Downloaded data was the same")
		}

		/* Rebuild and return to application delegate */
		Logger.log("Rebuilding blocker rules...")
		SFContentBlockerManager.reloadContentBlocker(withIdentifier: Constants.ContentBlockerBundleID, completionHandler:{(error) -> Void in
			if error == nil {
				Logger.log("Rebuild was successful")
			} else {
				Logger.log("ERROR (rebuilding rules): \(error!.localizedDescription)")
			}

			if dataIsNew {
				defaults?.set(currentDateAndTime, forKey:Constants.BlockerListUpdatedDateKey)
			}
			completionHandler?(dataIsNew ? .newData : .noData)
		})

	}
}
