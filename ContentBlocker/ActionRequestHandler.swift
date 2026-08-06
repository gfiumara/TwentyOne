/*
* ActionRequestHandler.swift
* Part of https://github.com/gfiumara/TwentyOne by Gregory Fiumara.
* See LICENSE for details.
*/

import UIKit
import UniformTypeIdentifiers
import MobileCoreServices

class ActionRequestHandler: NSObject, NSExtensionRequestHandling {

	func beginRequest(with context: NSExtensionContext)
	{
		let attachment:NSItemProvider
		if let fileURL = Constants.BlockerListFileURL, FileManager.default.fileExists(atPath:fileURL.path) {
			attachment = NSItemProvider(contentsOf:fileURL)!
		} else {
			attachment = NSItemProvider(contentsOf: Bundle.main.url(forResource: Constants.BlockerListNameKey, withExtension:Constants.JSONExtension))!
		}

		let item = NSExtensionItem()
		item.attachments = [attachment]
		context.completeRequest(returningItems: [item], completionHandler:nil)
	}

}
