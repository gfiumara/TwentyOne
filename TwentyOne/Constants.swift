//
//  Constants.swift
//  TwentyOne
//
//  Created by Greg Fiumara on 11/11/15.
//  Copyright © 2015 Greg Fiumara. All rights reserved.
//

import Foundation

struct Constants
{
	static let BackgroundSessionID = "com.gregfiumara.twentyone.backgroundDownload"
	static let AppGroupID = "group.com.gregfiumara.twentyone"
	static let BlockListURL:NSURL = NSURL.init(string:"")!
	static let BlockListFilename = "downloadedBlockerList.json"
	static let ErrorDomain = "TwentyOneErrorDomain"
	static let ErrorIO:Int = 100
}