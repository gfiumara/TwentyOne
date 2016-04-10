/*
 * ProceduralImages.swift
 * Part of http://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import UIKit

public class ProceduralImages : NSObject
{
	//// Cache

	private struct Cache {
		static let safariBlue: UIColor = UIColor(red: 0.340, green: 0.552, blue: 0.740, alpha: 1.000)
	}

	//// Colors

	public class var safariBlue: UIColor { return Cache.safariBlue }

	//// Drawing Methods

	public class func drawLargeSafari() {
		//// General Declarations
		let context = UIGraphicsGetCurrentContext()

		//// Oval Drawing
		let ovalPath = UIBezierPath(ovalInRect: CGRect(x: 10, y: 10, width: 380, height: 380))
		ProceduralImages.safariBlue.setFill()
		ovalPath.fill()
		ProceduralImages.safariBlue.setStroke()
		ovalPath.lineWidth = 2
		ovalPath.stroke()


		//// Group
		//// Polygon Drawing
		CGContextSaveGState(context)
		CGContextTranslateCTM(context, 267.85, 38.91)
		CGContextRotateCTM(context, 30 * CGFloat(M_PI) / 180)

		let polygonPath = UIBezierPath()
		polygonPath.moveToPoint(CGPoint(x: 25, y: 0))
		polygonPath.addLineToPoint(CGPoint(x: 46.65, y: 172.49))
		polygonPath.addLineToPoint(CGPoint(x: 3.35, y: 172.49))
		polygonPath.closePath()
		UIColor.redColor().setFill()
		polygonPath.fill()

		CGContextRestoreGState(context)


		//// Polygon 2 Drawing
		CGContextSaveGState(context)
		CGContextTranslateCTM(context, 133.15, 371.09)
		CGContextRotateCTM(context, -150 * CGFloat(M_PI) / 180)

		let polygon2Path = UIBezierPath()
		polygon2Path.moveToPoint(CGPoint(x: 25, y: 0))
		polygon2Path.addLineToPoint(CGPoint(x: 46.65, y: 172.49))
		polygon2Path.addLineToPoint(CGPoint(x: 3.35, y: 172.49))
		polygon2Path.closePath()
		UIColor.whiteColor().setFill()
		polygon2Path.fill()

		CGContextRestoreGState(context)
	}

	public class func drawLargeContentBlocker() {
		//// General Declarations
		let context = UIGraphicsGetCurrentContext()

		//// Polygon Drawing
		CGContextSaveGState(context)
		CGContextTranslateCTM(context, -53.78, 95.47)
		CGContextRotateCTM(context, -22.5 * CGFloat(M_PI) / 180)

		let polygonPath = UIBezierPath()
		polygonPath.moveToPoint(CGPoint(x: 195, y: 0))
		polygonPath.addLineToPoint(CGPoint(x: 332.89, y: 57.11))
		polygonPath.addLineToPoint(CGPoint(x: 390, y: 195))
		polygonPath.addLineToPoint(CGPoint(x: 332.89, y: 332.89))
		polygonPath.addLineToPoint(CGPoint(x: 195, y: 390))
		polygonPath.addLineToPoint(CGPoint(x: 57.11, y: 332.89))
		polygonPath.addLineToPoint(CGPoint(x: 0, y: 195))
		polygonPath.addLineToPoint(CGPoint(x: 57.11, y: 57.11))
		polygonPath.closePath()
		UIColor.redColor().setFill()
		polygonPath.fill()

		CGContextRestoreGState(context)


		//// Symbol Drawing
		let symbolRect = CGRect(x: 101, y: 101, width: 200, height: 200)
		CGContextSaveGState(context)
		UIRectClip(symbolRect)
		CGContextTranslateCTM(context, symbolRect.origin.x, symbolRect.origin.y)
		CGContextScaleCTM(context, symbolRect.size.width / 400, symbolRect.size.height / 400)

		ProceduralImages.drawLargeSafari()
		CGContextRestoreGState(context)
	}

	public class func drawLargeSettings() {
		//// General Declarations
		let context = UIGraphicsGetCurrentContext()

		//// Group 2
		//// Rectangle 5 Drawing
		let rectangle5Path = UIBezierPath(rect: CGRect(x: 165, y: 34, width: 70, height: 70))
		UIColor.darkGrayColor().setFill()
		rectangle5Path.fill()


		//// Rectangle 6 Drawing
		let rectangle6Path = UIBezierPath(rect: CGRect(x: 165, y: 296, width: 70, height: 70))
		UIColor.darkGrayColor().setFill()
		rectangle6Path.fill()


		//// Rectangle 7 Drawing
		let rectangle7Path = UIBezierPath(rect: CGRect(x: 34, y: 165, width: 70, height: 70))
		UIColor.darkGrayColor().setFill()
		rectangle7Path.fill()


		//// Rectangle 8 Drawing
		let rectangle8Path = UIBezierPath()
		rectangle8Path.moveToPoint(CGPoint(x: 295, y: 235))
		rectangle8Path.addLineToPoint(CGPoint(x: 365, y: 235))
		rectangle8Path.addLineToPoint(CGPoint(x: 365, y: 165))
		rectangle8Path.addLineToPoint(CGPoint(x: 295, y: 165))
		rectangle8Path.addLineToPoint(CGPoint(x: 295, y: 235))
		rectangle8Path.closePath()
		UIColor.darkGrayColor().setFill()
		rectangle8Path.fill()




		//// Group
		CGContextSaveGState(context)
		CGContextTranslateCTM(context, -34, 200)
		CGContextRotateCTM(context, -45 * CGFloat(M_PI) / 180)



		//// Rectangle Drawing
		let rectanglePath = UIBezierPath(rect: CGRect(x: 131, y: 0, width: 70, height: 70))
		UIColor.darkGrayColor().setFill()
		rectanglePath.fill()


		//// Rectangle 2 Drawing
		let rectangle2Path = UIBezierPath(rect: CGRect(x: 131, y: 262, width: 70, height: 70))
		UIColor.darkGrayColor().setFill()
		rectangle2Path.fill()


		//// Rectangle 3 Drawing
		let rectangle3Path = UIBezierPath(rect: CGRect(x: 0, y: 131, width: 70, height: 70))
		UIColor.darkGrayColor().setFill()
		rectangle3Path.fill()


		//// Rectangle 4 Drawing
		let rectangle4Path = UIBezierPath()
		rectangle4Path.moveToPoint(CGPoint(x: 261, y: 201))
		rectangle4Path.addLineToPoint(CGPoint(x: 331, y: 201))
		rectangle4Path.addLineToPoint(CGPoint(x: 331, y: 131))
		rectangle4Path.addLineToPoint(CGPoint(x: 261, y: 131))
		rectangle4Path.addLineToPoint(CGPoint(x: 261, y: 201))
		rectangle4Path.closePath()
		UIColor.darkGrayColor().setFill()
		rectangle4Path.fill()



		CGContextRestoreGState(context)


		//// Oval Drawing
		let ovalPath = UIBezierPath(ovalInRect: CGRect(x: 75, y: 75, width: 250, height: 250))
		UIColor.darkGrayColor().setFill()
		ovalPath.fill()
		UIColor.darkGrayColor().setStroke()
		ovalPath.lineWidth = 2
		ovalPath.stroke()


		//// Oval 2 Drawing
		let oval2Path = UIBezierPath(ovalInRect: CGRect(x: 150, y: 150, width: 100, height: 100))
		UIColor.whiteColor().setFill()
		oval2Path.fill()
		UIColor.darkGrayColor().setStroke()
		oval2Path.lineWidth = 2
		oval2Path.stroke()
	}

	public class func drawAppStore() {
		//// General Declarations
		let context = UIGraphicsGetCurrentContext()

		//// Rectangle Drawing
		let rectanglePath = UIBezierPath(roundedRect: CGRect(x: 112, y: 212, width: 800, height: 600), cornerRadius: 100)
		UIColor.whiteColor().setFill()
		rectanglePath.fill()
		UIColor.darkGrayColor().setStroke()
		rectanglePath.lineWidth = 20
		rectanglePath.stroke()


		//// Text Drawing
		let textRect = CGRect(x: 464.81, y: 431.09, width: 392.75, height: 161.82)
		let textTextContent = NSString(string: "XXI")
		let textStyle = NSMutableParagraphStyle()
		textStyle.alignment = .Left

		let textFontAttributes = [NSFontAttributeName: UIFont(name: "Superclarendon-Regular", size: 175)!, NSForegroundColorAttributeName: UIColor.blackColor(), NSParagraphStyleAttributeName: textStyle]

		let textTextHeight: CGFloat = textTextContent.boundingRectWithSize(CGSize(width: textRect.width, height: CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: textFontAttributes, context: nil).size.height
		CGContextSaveGState(context)
		CGContextClipToRect(context, textRect)
		textTextContent.drawInRect(CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
		CGContextRestoreGState(context)


		//// Rectangle 3 Drawing
		let rectangle3Path = UIBezierPath(roundedRect: CGRect(x: 464.56, y: 282, width: 393, height: 50), cornerRadius: 10)
		UIColor.lightGrayColor().setFill()
		rectangle3Path.fill()


		//// Rectangle 4 Drawing
		let rectangle4Path = UIBezierPath(roundedRect: CGRect(x: 464.81, y: 692, width: 393, height: 50), cornerRadius: 10)
		UIColor.lightGrayColor().setFill()
		rectangle4Path.fill()


		//// Group
		//// Oval Drawing
		let ovalPath = UIBezierPath(ovalInRect: CGRect(x: 244.5, y: 384, width: 100, height: 100))
		UIColor.blackColor().setFill()
		ovalPath.fill()


		//// Rectangle 5 Drawing
		let rectangle5Path = UIBezierPath(roundedRect: CGRect(x: 213.5, y: 476, width: 162, height: 260), byRoundingCorners: [UIRectCorner.TopLeft, UIRectCorner.TopRight], cornerRadii: CGSize(width: 25, height: 25))
		rectangle5Path.closePath()
		UIColor.blackColor().setFill()
		rectangle5Path.fill()


		//// Rectangle 6 Drawing
		let rectangle6Path = UIBezierPath(roundedRect: CGRect(x: 244.5, y: 541.97, width: 10.5, height: 194.03), byRoundingCorners: [UIRectCorner.TopLeft, UIRectCorner.TopRight], cornerRadii: CGSize(width: 5.25, height: 5.25))
		rectangle6Path.closePath()
		UIColor.whiteColor().setFill()
		rectangle6Path.fill()


		//// Rectangle 7 Drawing
		let rectangle7Path = UIBezierPath(roundedRect: CGRect(x: 334.5, y: 541.97, width: 10, height: 194.03), byRoundingCorners: [UIRectCorner.TopLeft, UIRectCorner.TopRight], cornerRadii: CGSize(width: 5, height: 5))
		rectangle7Path.closePath()
		UIColor.whiteColor().setFill()
		rectangle7Path.fill()




		//// Rectangle 2 Drawing
		let rectangle2Path = UIBezierPath(roundedRect: CGRect(x: 182, y: 282, width: 225, height: 460), cornerRadius: 25)
		UIColor.grayColor().setStroke()
		rectangle2Path.lineWidth = 20
		rectangle2Path.stroke()
	}

	public class func drawSafariStepIcon(stepSize stepSize: CGSize = CGSize(width: 40, height: 40)) {
		//// General Declarations
		let context = UIGraphicsGetCurrentContext()

		//// Symbol Drawing
		let symbolRect = CGRect(x: 0, y: 0, width: stepSize.width, height: stepSize.height)
		CGContextSaveGState(context)
		UIRectClip(symbolRect)
		CGContextTranslateCTM(context, symbolRect.origin.x, symbolRect.origin.y)
		CGContextScaleCTM(context, symbolRect.size.width / 400, symbolRect.size.height / 400)

		ProceduralImages.drawLargeSafari()
		CGContextRestoreGState(context)
	}

	public class func drawSettingsStepIcon(stepSize stepSize: CGSize = CGSize(width: 40, height: 40)) {
		//// General Declarations
		let context = UIGraphicsGetCurrentContext()

		//// Symbol Drawing
		let symbolRect = CGRect(x: 0, y: 0, width: stepSize.width, height: stepSize.height)
		CGContextSaveGState(context)
		UIRectClip(symbolRect)
		CGContextTranslateCTM(context, symbolRect.origin.x, symbolRect.origin.y)
		CGContextScaleCTM(context, symbolRect.size.width / 400, symbolRect.size.height / 400)

		ProceduralImages.drawLargeSettings()
		CGContextRestoreGState(context)
	}

	public class func drawContentBlockerStepIcon(stepSize stepSize: CGSize = CGSize(width: 40, height: 40)) {
		//// General Declarations
		let context = UIGraphicsGetCurrentContext()

		//// Symbol Drawing
		let symbolRect = CGRect(x: 0, y: 0, width: stepSize.width, height: stepSize.height)
		CGContextSaveGState(context)
		UIRectClip(symbolRect)
		CGContextTranslateCTM(context, symbolRect.origin.x, symbolRect.origin.y)
		CGContextScaleCTM(context, symbolRect.size.width / 400, symbolRect.size.height / 400)

		ProceduralImages.drawLargeContentBlocker()
		CGContextRestoreGState(context)
	}

	public class func drawTwentyOneStepIcon(stepSize stepSize: CGSize = CGSize(width: 40, height: 40)) {
		//// General Declarations
		let context = UIGraphicsGetCurrentContext()

		//// Symbol Drawing
		let symbolRect = CGRect(x: 0, y: 0, width: stepSize.width, height: stepSize.height)
		CGContextSaveGState(context)
		UIRectClip(symbolRect)
		CGContextTranslateCTM(context, symbolRect.origin.x, symbolRect.origin.y)
		CGContextScaleCTM(context, symbolRect.size.width / 1024, symbolRect.size.height / 1024)

		ProceduralImages.drawAppStore()
		CGContextRestoreGState(context)
	}

	public class func drawTwentyOneHeaderIcon(headerSize headerSize: CGSize = CGSize(width: 128, height: 128)) {
		//// General Declarations
		let context = UIGraphicsGetCurrentContext()

		//// Symbol Drawing
		let symbolRect = CGRect(x: 0, y: 0, width: headerSize.width, height: headerSize.height)
		CGContextSaveGState(context)
		UIRectClip(symbolRect)
		CGContextTranslateCTM(context, symbolRect.origin.x, symbolRect.origin.y)
		CGContextScaleCTM(context, symbolRect.size.width / 1024, symbolRect.size.height / 1024)
		
		ProceduralImages.drawAppStore()
		CGContextRestoreGState(context)
	}
	
}
