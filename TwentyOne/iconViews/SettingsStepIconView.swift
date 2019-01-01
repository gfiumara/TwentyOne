/*
 * SettingsStepIconView.swift
 * Part of https://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import UIKit

@IBDesignable class SettingsStepIconView:UIView
{
	override func draw(_ rect: CGRect)
	{
		ProceduralImages.drawSettingsStepIcon(stepSize:rect.size)
	}
}
