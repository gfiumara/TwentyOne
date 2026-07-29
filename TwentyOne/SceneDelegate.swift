/*
 * SceneDelegate.swift
 * Part of https://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate
{
	var window: UIWindow?

	func scene(_ scene:UIScene, willConnectTo session:UISceneSession, options connectionOptions:UIScene.ConnectionOptions)
	{
		guard let windowScene = scene as? UIWindowScene else { return }

		let storyboard = UIStoryboard(name:"Main", bundle:nil)
		self.window = UIWindow(windowScene:windowScene)
		self.window?.rootViewController = storyboard.instantiateInitialViewController()
		self.window?.makeKeyAndVisible()
	}
}
