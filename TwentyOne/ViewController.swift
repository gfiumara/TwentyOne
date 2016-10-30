/*
 * ViewController.swift
 * Part of http://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import SafariServices
import UIKit

class ViewController: UIViewController
{
	@IBOutlet weak var headLabel: UILabel!
	@IBOutlet weak var subheadLabel: UILabel!
	@IBOutlet weak var listLastUpdatedLabel: UILabel!
	@IBOutlet weak var listLastCheckedLabel: UILabel!
	@IBOutlet weak var enableTwentyOneLabel: UILabel!
	@IBOutlet weak var forceUpdateButton: UIButton!
	@IBOutlet weak var openSettingsAppButton: UIButton!
	var enterForegroundObserver:NSObjectProtocol?

	private lazy var dateFormatter:DateFormatter = {
		let df = DateFormatter()
		df.dateStyle = .medium
		df.timeStyle = .short
		df.doesRelativeDateFormatting = true
		return (df)
	}()

	override func viewDidLoad()
	{
		super.viewDidLoad()

		var appName:String? = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String?
		if appName == nil {
			appName = "Twenty One"
		} else {
			self.headLabel.text = appName!
			self.enableTwentyOneLabel.text = "Enable \(appName!)"
		}

		self.enterForegroundObserver = NotificationCenter.default.addObserver(forName:.UIApplicationWillEnterForeground, object:nil, queue:OperationQueue.main, using:{(Notification) in
			weak var weakSelf = self
			weakSelf?.updateInstructions()
		})
		self.updateInstructions()

		self.openSettingsAppButton.isEnabled = UIApplication.shared.canOpenURL(Constants.SettingsAppURL as URL)

		self.updateDates()
	}

	deinit
	{
		if let observer = self.enterForegroundObserver {
			NotificationCenter.default.removeObserver(observer, name:.UIApplicationWillEnterForeground, object:nil)
		}
	}

	func updateDates()
	{
		let defaults = UserDefaults.init(suiteName:Constants.AppGroupID)
		let lastCheckedDate = defaults?.object(forKey: Constants.BlockerListRetrievedDateKey)
		let lastUpdatedDate = defaults?.object(forKey: Constants.BlockerListUpdatedDateKey)

		if lastUpdatedDate == nil {
			self.listLastUpdatedLabel.text = "Using default list."
		} else {
			self.listLastUpdatedLabel.text = "List last updated \(self.dateFormatter.string(from: lastUpdatedDate as! Date))."
		}

		if lastCheckedDate == nil {
			self.listLastCheckedLabel.text = "Never checked for list updates."
		} else {
			self.listLastCheckedLabel.text = "Last checked for list updates \(self.dateFormatter.string(from: lastCheckedDate as! Date))."
		}
	}

	@IBAction func openSettingsAppButtonPressed(_ button:UIButton)
	{
		if UIApplication.shared.canOpenURL(Constants.SettingsAppURL as URL) {
			UIApplication.shared.openURL(Constants.SettingsAppURL as URL)
		}
	}

	override var prefersStatusBarHidden : Bool
	{
		return (false)
	}

	@IBAction func forceUpdateButtonPressed(_ button:UIButton)
	{
		self.forceUpdateButton.isEnabled = false
		self.forceUpdateButton.setTitle("Fetching update...", for:UIControlState())
		ForegroundDownloader.updateBlocklist({(data, response) in
			BlockListUpdater.saveAndRecompileNewBlockListData(data, completionHandler:{(result) in
				Logger.log("Retrieved block list data from remote")
				DispatchQueue.main.async(execute: {
					self.updateDates()
					self.forceUpdateButton.setTitle("Successfully Forced Update", for:UIControlState())
				})
			})
			}, failure:{(error, response) in
				Logger.log("ERROR (update blocklist): \(error.localizedDescription)")
				DispatchQueue.main.async(execute: {
					self.forceUpdateButton.setAttributedTitle(NSAttributedString.init(string:"An Error Occurred", attributes:[NSForegroundColorAttributeName:UIColor.red]), for:UIControlState())
					self.forceUpdateButton.isEnabled = true
					self.updateDates()

					let delayTime = DispatchTime.now() + Double(Int64(3 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
					DispatchQueue.main.asyncAfter(deadline: delayTime) {
						self.forceUpdateButton.setTitle("Force Update", for:UIControlState())
					}
				})
		})
	}

	func updateInstructions()
	{
		SFContentBlockerManager.getStateOfContentBlocker(withIdentifier:Constants.ContentBlockerBundleID, completionHandler:{(state, error) in
			if let e = error {
				Logger.log("ERROR (get blocker state): \(e.localizedDescription)")
				return
			}

			DispatchQueue.main.async {
				if let enabled = state?.isEnabled {
					if enabled {
						self.subheadLabel.text = "Twenty One is currently enabled. To disable, follow these instructions."
						self.enableTwentyOneLabel.text = "Disable Twenty One"
					} else {
						self.subheadLabel.text = "Follow these instructions to block many (but not all) age gates on alcohol-related websites."
						self.enableTwentyOneLabel.text = "Enable Twenty One"
					}
				}
			}
		});
	}
}

