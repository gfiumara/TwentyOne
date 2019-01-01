/*
 * AppDelegate.swift
 * Part of https://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey: Any]?) -> Bool
	{
		application.setMinimumBackgroundFetchInterval(UIApplication.backgroundFetchIntervalMinimum)
		return (true)
	}

	func application(_ application:UIApplication, performFetchWithCompletionHandler completionHandler:@escaping (UIBackgroundFetchResult) -> Void)
	{
		Logger.log("Launched due to performFetch")
		let downloader = BackgroundDownloader.init(completionHandler:completionHandler)
		downloader.updateBlockList()
	}
}

