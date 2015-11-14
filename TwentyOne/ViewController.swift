//
//  ViewController.swift
//  TwentyOne
//
//  Created by Greg Fiumara on 11/11/15.
//  Copyright © 2015 Greg Fiumara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var headLabel: UILabel!
	@IBOutlet weak var subheadLabel: UILabel!
	@IBOutlet weak var listLastUpdatedLabel: UILabel!
	@IBOutlet weak var listLastCheckedLabel: UILabel!
	@IBOutlet weak var enableTwentyOneLabel: UILabel!
	@IBOutlet weak var forceUpdateButton: UIButton!

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

		self.subheadLabel.text = "Follow these instructions to block many age gates on alcohol-related websites."

		self.updateDates()
	}

	func updateDates()
	{
		var onceToken:dispatch_once_t = 0
		var dateFormatter:NSDateFormatter? = nil
		dispatch_once(&onceToken) {
			dateFormatter = NSDateFormatter()
			dateFormatter?.dateStyle = .LongStyle
			dateFormatter?.timeStyle = .ShortStyle
			dateFormatter?.doesRelativeDateFormatting = true
		}

		let defaults = NSUserDefaults.init(suiteName:Constants.AppGroupID)
		let lastCheckedDate = defaults?.objectForKey(Constants.BlockerListRetrievedDateKey)
		let lastUpdatedDate = defaults?.objectForKey(Constants.BlockerListUpdatedDateKey)

		if lastUpdatedDate == nil {
			self.listLastUpdatedLabel.text = "List has never been updated."
		} else {
			self.listLastUpdatedLabel.text = "List last updated \(dateFormatter!.stringFromDate(lastUpdatedDate as! NSDate))"
		}

		if lastCheckedDate == nil {
			self.listLastCheckedLabel.text = "Never checked for list updates."
		} else {
			self.listLastCheckedLabel.text = "Last checked for list updates \(dateFormatter!.stringFromDate(lastCheckedDate as! NSDate))"
		}
	}

	@IBAction func openSettingsAppButtonPressed(button:UIButton)
	{
	}

	@IBAction func forceUpdateButtonPressed(button:UIButton)
	{
	}
}

