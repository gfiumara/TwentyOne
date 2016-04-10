/*
 * ContentBlockerStepIconView.swift
 * Part of http://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import UIKit

@IBDesignable public class ContentBlockerStepIconView:UIView
{
	override public func drawRect(rect: CGRect)
	{
		ProceduralImages.drawContentBlockerStepIcon(stepSize:rect.size)
	}
}
