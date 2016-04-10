/*
 * SafariStepIconView.swift
 * Part of http://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import UIKit

@IBDesignable class SafariStepIconView:UIView
{
	override func drawRect(rect: CGRect)
	{
		ProceduralImages.drawSafariStepIcon(stepSize:rect.size)
	}
}
