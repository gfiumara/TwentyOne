/*
 * TwentyOneStepIconView.swift
 * Part of http://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import UIKit

@IBDesignable open class TwentyOneStepIconView:UIView
{
	override open func draw(_ rect: CGRect)
	{
		ProceduralImages.drawTwentyOneStepIcon(stepSize:rect.size)
	}
}
