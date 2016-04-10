/*
 * SettingsStepIconView.swift
 * Part of http://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import UIKit

@IBDesignable class SettingsStepIconView:UIView
{
	override func drawRect(rect: CGRect)
	{
		ProceduralImages.drawSettingsStepIcon(stepSize:rect.size)
	}
}
