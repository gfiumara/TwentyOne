//
//  ActionRequestHandler.swift
//  ContentBlocker
//
//  Created by Greg Fiumara on 11/11/15.
//  Copyright © 2015 Greg Fiumara. All rights reserved.
//

import UIKit
import MobileCoreServices

class ActionRequestHandler: NSObject, NSExtensionRequestHandling {

	func beginRequestWithExtensionContext(context: NSExtensionContext)
	{
		let defaults = NSUserDefaults.init(suiteName:Constants.AppGroupID)
		if defaults?.objectForKey(Constants.BlockerListKey) != nil {
			let str = defaults?.objectForKey(Constants.BlockerListKey) as! String!
			let data = str.dataUsingEncoding(NSUTF8StringEncoding)
			let attachment = NSItemProvider(item:data, typeIdentifier:kUTTypeJSON as String)
			let item = NSExtensionItem()
			item.attachments = [attachment]
			context.completeRequestReturningItems([item], completionHandler:nil)
		} else {
			let attachment = NSItemProvider(contentsOfURL: NSBundle.mainBundle().URLForResource("blockerList", withExtension: "json"))!
			let item = NSExtensionItem()
			item.attachments = [attachment]
			context.completeRequestReturningItems([item], completionHandler: nil);
		}

	}

}
