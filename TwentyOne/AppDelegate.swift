/*
 * AppDelegate.swift
 * Part of http://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
	var window: UIWindow?

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions:[NSObject : AnyObject]?) -> Bool
	{
		application.setMinimumBackgroundFetchInterval(UIApplicationBackgroundFetchIntervalMinimum)
		return (true)
	}

	func application(application:UIApplication, performFetchWithCompletionHandler completionHandler:(UIBackgroundFetchResult) -> Void)
	{
		Logger.log("Launched due to performFetch")
		let downloader = BackgroundDownloader.init(completionHandler:completionHandler)
		downloader.updateBlockList()
	}
}

