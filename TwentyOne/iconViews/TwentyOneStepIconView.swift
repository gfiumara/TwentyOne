/*
 * TwentyOneStepIconView.swift
 * Part of http://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import UIKit

@IBDesignable public class TwentyOneStepIconView:UIView
{
	override public func drawRect(rect: CGRect)
	{
		ProceduralImages.drawTwentyOneStepIcon(stepSize:rect.size)
	}
}
