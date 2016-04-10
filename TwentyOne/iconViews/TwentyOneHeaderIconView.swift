/*
 * TwentyOneHeaderIconView.swift
 * Part of http://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import UIKit

@IBDesignable public class TwentyOneHeaderIconView:UIView
{
	override public func drawRect(rect: CGRect)
	{
		ProceduralImages.drawTwentyOneHeaderIcon(headerSize:rect.size)
	}
}
