/*
 * AppDelegate.swift
 * Part of https://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import BackgroundTasks
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey: Any]?) -> Bool
	{
		BGTaskScheduler.shared.register(forTaskWithIdentifier:Constants.BackgroundSessionID, using:nil) { task in
			self.handleBackgroundDownload(task:task as! BGProcessingTask)
		}
		self.scheduleBackgroundDownload()
		return (true)
	}

	func application(_ application:UIApplication, configurationForConnecting connectingSceneSession:UISceneSession, options:UIScene.ConnectionOptions) -> UISceneConfiguration
	{
		return UISceneConfiguration(name:"Default Configuration", sessionRole:connectingSceneSession.role)
	}

	func application(_ application:UIApplication, didDiscardSceneSessions sceneSessions:Set<UISceneSession>)
	{
	}

	func applicationDidEnterBackground(_ application:UIApplication)
	{
		self.scheduleBackgroundDownload()
	}

	private func scheduleBackgroundDownload()
	{
		let request = BGProcessingTaskRequest(identifier:Constants.BackgroundSessionID)
		request.requiresNetworkConnectivity = true

		do {
			try BGTaskScheduler.shared.submit(request)
		} catch {
			#if !targetEnvironment(simulator)
			Logger.log("Could not schedule background download: \(error)")
			#endif
		}
	}

	private func handleBackgroundDownload(task:BGProcessingTask)
	{
		Logger.log("Launched due to BGProcessingTask")
		self.scheduleBackgroundDownload()

		let downloader = BackgroundDownloader.init(completionHandler:{ result in
			task.setTaskCompleted(success:result != .failed)
		})
		task.expirationHandler = {
			Logger.log("BGProcessingTask expired before completion")
			task.setTaskCompleted(success:false)
		}

		downloader.updateBlockList()
	}
}

