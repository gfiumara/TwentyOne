/*
 * Constants.swift
 * Part of http://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import Foundation

struct Constants
{
	static let BackgroundSessionID = "com.gregfiumara.twentyone.backgroundDownload"
	static let AppGroupID = "group.com.gregfiumara.twentyone"
	static let BlockListURL:NSURL = NSURL.init(string:"https://raw.githubusercontent.com/gfiumara/TwentyOne/master/SafariExtension/twentyone.safariextension/blockerList.json")!
	static let SettingsAppURL = NSURL.init(string:"prefs://")!
	static let ContentBlockerBundleID = "com.gregfiumara.twentyone.contentblocker"
	static let BlockerListNameKey = "blockerList"
	static let JSONExtension = "json"
	static let BlockerListRetrievedDateKey = "BlockerListRetrievedDate"
	static let BlockerListUpdatedDateKey = "BlockerListUpdatedDate"
}
