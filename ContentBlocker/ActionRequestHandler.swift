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
		let fileManager = NSFileManager.defaultManager()
		let uncoordinatedURL = fileManager.containerURLForSecurityApplicationGroupIdentifier(Constants.AppGroupID)!.URLByAppendingPathComponent(Constants.BlockListFilename)

		if fileManager.fileExistsAtPath(uncoordinatedURL.path!) {
			Logger.log("Using downloaded blocker list")

			let fileCoordinator = NSFileCoordinator.init(filePresenter:nil)
			var error:NSError?
			var operationDidFinish:Bool = false
			var attachment:NSItemProvider?
			fileCoordinator.coordinateReadingItemAtURL(uncoordinatedURL, options:.ResolvesSymbolicLink, error:&error, byAccessor:{(readingURL) in
				attachment = NSItemProvider(contentsOfURL:readingURL)
				operationDidFinish = (attachment == nil)
			})

			if error != nil {
				Logger.log("ERROR: \(error?.localizedDescription)")
				context.cancelRequestWithError(error!)
				return
			}

			if operationDidFinish == false {
				Logger.log("ERROR: Operation did not finish")
				context.cancelRequestWithError(NSError.init(domain:Constants.ErrorDomain, code:Constants.ErrorIO, userInfo:nil))
				return
			}

			let item = NSExtensionItem()
			item.attachments = [attachment!]
			context.completeRequestReturningItems([item], completionHandler: nil);


		} else {
			Logger.log("Using bundled blocker list")

			let attachment = NSItemProvider(contentsOfURL: NSBundle.mainBundle().URLForResource("blockerList", withExtension: "json"))!
			let item = NSExtensionItem()
			item.attachments = [attachment]
			context.completeRequestReturningItems([item], completionHandler: nil);
		}

	}

}
