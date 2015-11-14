//
//  TwentyOneStepIconView.swift
//  TwentyOne
//
//  Created by Greg Fiumara on 11/14/15.
//  Copyright © 2015 Greg Fiumara. All rights reserved.
//

import UIKit

@IBDesignable public class TwentyOneStepIconView:UIView
{
	override public func drawRect(rect: CGRect)
	{
		ProceduralImages.drawTwentyOneStepIcon()
	}
}
