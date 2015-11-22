/*
 * ViewController.swift
 * Part of http://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var headLabel: UILabel!
	@IBOutlet weak var subheadLabel: UILabel!
	@IBOutlet weak var listLastUpdatedLabel: UILabel!
	@IBOutlet weak var listLastCheckedLabel: UILabel!
	@IBOutlet weak var enableTwentyOneLabel: UILabel!
	@IBOutlet weak var forceUpdateButton: UIButton!
	@IBOutlet weak var openSettingsAppButton: UIButton!
	
	override func viewDidLoad()
	{
		super.viewDidLoad()

		var appName:String? = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as! String?
		if appName == nil {
			appName = "Twenty One"
		} else {
			self.headLabel.text = appName!
			self.enableTwentyOneLabel.text = "Enable \(appName!)"
		}

		self.subheadLabel.text = "Follow these instructions to block age gates on many alcohol-related websites."

		self.openSettingsAppButton.enabled = UIApplication.sharedApplication().canOpenURL(Constants.SettingsAppURL)

		self.updateDates()
	}

	func updateDates()
	{
		var onceToken:dispatch_once_t = 0
		var dateFormatter:NSDateFormatter? = nil
		dispatch_once(&onceToken) {
			dateFormatter = NSDateFormatter()
			dateFormatter?.dateStyle = .MediumStyle
			dateFormatter?.timeStyle = .ShortStyle
			dateFormatter?.doesRelativeDateFormatting = true
		}

		let defaults = NSUserDefaults.init(suiteName:Constants.AppGroupID)
		let lastCheckedDate = defaults?.objectForKey(Constants.BlockerListRetrievedDateKey)
		let lastUpdatedDate = defaults?.objectForKey(Constants.BlockerListUpdatedDateKey)

		if lastUpdatedDate == nil {
			self.listLastUpdatedLabel.text = "Using default list."
		} else {
			self.listLastUpdatedLabel.text = "List last updated \(dateFormatter!.stringFromDate(lastUpdatedDate as! NSDate))."
		}

		if lastCheckedDate == nil {
			self.listLastCheckedLabel.text = "Never checked for list updates."
		} else {
			self.listLastCheckedLabel.text = "Last checked for list updates \(dateFormatter!.stringFromDate(lastCheckedDate as! NSDate))."
		}
	}

	@IBAction func openSettingsAppButtonPressed(button:UIButton)
	{
		if UIApplication.sharedApplication().canOpenURL(Constants.SettingsAppURL) {
			UIApplication.sharedApplication().openURL(Constants.SettingsAppURL)
		}
	}

	override func prefersStatusBarHidden() -> Bool
	{
		return (false)
	}

	@IBAction func forceUpdateButtonPressed(button:UIButton)
	{
		self.forceUpdateButton.enabled = false
		self.forceUpdateButton.setTitle("Fetching update...", forState:.Normal)
		ForegroundDownloader.updateBlocklist({(data, response) in
			BlockListUpdater.saveAndRecompileNewBlockListData(data, completionHandler:{(result) in
				Logger.log("Retrieved block list data from remote")
				dispatch_async(dispatch_get_main_queue(), {
					self.updateDates()
					self.forceUpdateButton.setTitle("Successfully Forced Update", forState:.Normal)
				})
			})
			}, failure:{(error, response) in
				Logger.log("ERROR (update blocklist): \(error.localizedDescription)")
				dispatch_async(dispatch_get_main_queue(), {
					self.forceUpdateButton.setAttributedTitle(NSAttributedString.init(string:"An Error Occurred", attributes:[NSForegroundColorAttributeName:UIColor.redColor()]), forState:.Normal)
					self.forceUpdateButton.enabled = true
					self.updateDates()

					let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(3 * Double(NSEC_PER_SEC)))
					dispatch_after(delayTime, dispatch_get_main_queue()) {
						self.forceUpdateButton.setTitle("Force Update", forState:.Normal)
					}
				})
		})
	}
}

