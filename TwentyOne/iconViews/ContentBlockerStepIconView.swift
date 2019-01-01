/*
 * ContentBlockerStepIconView.swift
 * Part of https://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import UIKit

@IBDesignable open class ContentBlockerStepIconView:UIView
{
	override open func draw(_ rect: CGRect)
	{
		ProceduralImages.drawContentBlockerStepIcon(stepSize:rect.size)
	}
}
