/*
 * ActionRequestHandler.swift
 * Part of http://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import UIKit
import MobileCoreServices

class ActionRequestHandler: NSObject, NSExtensionRequestHandling {

	func beginRequest(with context: NSExtensionContext)
	{
		let defaults = UserDefaults.init(suiteName:Constants.AppGroupID)
		if defaults?.object(forKey: Constants.BlockerListNameKey) != nil {
			let str = defaults?.object(forKey: Constants.BlockerListNameKey) as! String!
			let data = str?.data(using: String.Encoding.utf8)
			let attachment = NSItemProvider(item:data as NSSecureCoding?, typeIdentifier:kUTTypeJSON as String)
			let item = NSExtensionItem()
			item.attachments = [attachment]
			context.completeRequest(returningItems: [item], completionHandler:nil)
		} else {
			let attachment = NSItemProvider(contentsOf: Bundle.main.url(forResource: Constants.BlockerListNameKey, withExtension:Constants.JSONExtension))!
			let item = NSExtensionItem()
			item.attachments = [attachment]
			context.completeRequest(returningItems: [item], completionHandler: nil);
		}
	}

}
