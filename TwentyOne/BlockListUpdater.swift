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
		self.reloadContentBlocker(attempt:1, dataIsNew:dataIsNew, currentDateAndTime:currentDateAndTime, defaults:defaults, completionHandler:completionHandler)
	}

	private static let maxReloadAttempts = 3
	private static func reloadContentBlocker(attempt:Int, dataIsNew:Bool, currentDateAndTime:Date, defaults:UserDefaults?, completionHandler:((UIBackgroundFetchResult) -> Void)?)
	{
		SFContentBlockerManager.reloadContentBlocker(withIdentifier: Constants.ContentBlockerBundleID, completionHandler:{(error) -> Void in
			if error == nil {
				Logger.log("Rebuild was successful")
			/*
			 * SFContentBlockerManager.reloadContentBlocker is known
			 * to intermittently fail with SFErrorLoadingInterrupted
			 * (FB17959360). Retry a few times with a short delay.
			 */
			} else if attempt < maxReloadAttempts {
				Logger.log("ERROR (rebuilding rules, attempt \(attempt)/\(maxReloadAttempts)): \(error!.localizedDescription). Retrying.")
				DispatchQueue.main.asyncAfter(deadline:.now() + 1.5) {
					self.reloadContentBlocker(attempt:attempt + 1, dataIsNew:dataIsNew, currentDateAndTime:currentDateAndTime, defaults:defaults, completionHandler:completionHandler)
				}
				return
			} else {
				Logger.log("ERROR (rebuilding rules, giving up after \(attempt) attempts): \(error!.localizedDescription)")
			}

			if dataIsNew {
				defaults?.set(currentDateAndTime, forKey:Constants.BlockerListUpdatedDateKey)
			}
			completionHandler?(dataIsNew ? .newData : .noData)
		})

	}
}
