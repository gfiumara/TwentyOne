/*
 * TwentyOneHeaderIconView.swift
 * Part of http://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import UIKit

@IBDesignable open class TwentyOneHeaderIconView:UIView
{
	override open func draw(_ rect: CGRect)
	{
		ProceduralImages.drawTwentyOneHeaderIcon(headerSize:rect.size)
	}
}
