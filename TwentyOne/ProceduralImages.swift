/*
 * ProceduralImages.swift
 * Part of http://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import UIKit

open class ProceduralImages : NSObject
{
	//// Cache

	fileprivate struct Cache {
		static let safariBlue: UIColor = UIColor(red: 0.340, green: 0.552, blue: 0.740, alpha: 1.000)
	}

	//// Colors

	open class var safariBlue: UIColor { return Cache.safariBlue }

	//// Drawing Methods

	open class func drawLargeSafari() {
		//// General Declarations
		let context = UIGraphicsGetCurrentContext()

		//// Oval Drawing
		let ovalPath = UIBezierPath(ovalIn: CGRect(x: 10, y: 10, width: 380, height: 380))
		ProceduralImages.safariBlue.setFill()
		ovalPath.fill()
		ProceduralImages.safariBlue.setStroke()
		ovalPath.lineWidth = 2
		ovalPath.stroke()


		//// Group
		//// Polygon Drawing
		context?.saveGState()
		context?.translateBy(x: 267.85, y: 38.91)
		context?.rotate(by: 30 * CGFloat(Float.pi) / 180)

		let polygonPath = UIBezierPath()
		polygonPath.move(to: CGPoint(x: 25, y: 0))
		polygonPath.addLine(to: CGPoint(x: 46.65, y: 172.49))
		polygonPath.addLine(to: CGPoint(x: 3.35, y: 172.49))
		polygonPath.close()
		UIColor.red.setFill()
		polygonPath.fill()

		context?.restoreGState()


		//// Polygon 2 Drawing
		context?.saveGState()
		context?.translateBy(x: 133.15, y: 371.09)
		context?.rotate(by: -150 * CGFloat(Float.pi) / 180)

		let polygon2Path = UIBezierPath()
		polygon2Path.move(to: CGPoint(x: 25, y: 0))
		polygon2Path.addLine(to: CGPoint(x: 46.65, y: 172.49))
		polygon2Path.addLine(to: CGPoint(x: 3.35, y: 172.49))
		polygon2Path.close()
		UIColor.white.setFill()
		polygon2Path.fill()

		context?.restoreGState()
	}

	open class func drawLargeContentBlocker() {
		//// General Declarations
		let context = UIGraphicsGetCurrentContext()

		//// Polygon Drawing
		context?.saveGState()
		context?.translateBy(x: -53.78, y: 95.47)
		context?.rotate(by: -22.5 * CGFloat(Float.pi) / 180)

		let polygonPath = UIBezierPath()
		polygonPath.move(to: CGPoint(x: 195, y: 0))
		polygonPath.addLine(to: CGPoint(x: 332.89, y: 57.11))
		polygonPath.addLine(to: CGPoint(x: 390, y: 195))
		polygonPath.addLine(to: CGPoint(x: 332.89, y: 332.89))
		polygonPath.addLine(to: CGPoint(x: 195, y: 390))
		polygonPath.addLine(to: CGPoint(x: 57.11, y: 332.89))
		polygonPath.addLine(to: CGPoint(x: 0, y: 195))
		polygonPath.addLine(to: CGPoint(x: 57.11, y: 57.11))
		polygonPath.close()
		UIColor.red.setFill()
		polygonPath.fill()

		context?.restoreGState()


		//// Symbol Drawing
		let symbolRect = CGRect(x: 101, y: 101, width: 200, height: 200)
		context?.saveGState()
		UIRectClip(symbolRect)
		context?.translateBy(x: symbolRect.origin.x, y: symbolRect.origin.y)
		context?.scaleBy(x: symbolRect.size.width / 400, y: symbolRect.size.height / 400)

		ProceduralImages.drawLargeSafari()
		context?.restoreGState()
	}

	open class func drawLargeSettings() {
		//// General Declarations
		let context = UIGraphicsGetCurrentContext()

		//// Group 2
		//// Rectangle 5 Drawing
		let rectangle5Path = UIBezierPath(rect: CGRect(x: 165, y: 34, width: 70, height: 70))
		UIColor.darkGray.setFill()
		rectangle5Path.fill()


		//// Rectangle 6 Drawing
		let rectangle6Path = UIBezierPath(rect: CGRect(x: 165, y: 296, width: 70, height: 70))
		UIColor.darkGray.setFill()
		rectangle6Path.fill()


		//// Rectangle 7 Drawing
		let rectangle7Path = UIBezierPath(rect: CGRect(x: 34, y: 165, width: 70, height: 70))
		UIColor.darkGray.setFill()
		rectangle7Path.fill()


		//// Rectangle 8 Drawing
		let rectangle8Path = UIBezierPath()
		rectangle8Path.move(to: CGPoint(x: 295, y: 235))
		rectangle8Path.addLine(to: CGPoint(x: 365, y: 235))
		rectangle8Path.addLine(to: CGPoint(x: 365, y: 165))
		rectangle8Path.addLine(to: CGPoint(x: 295, y: 165))
		rectangle8Path.addLine(to: CGPoint(x: 295, y: 235))
		rectangle8Path.close()
		UIColor.darkGray.setFill()
		rectangle8Path.fill()




		//// Group
		context?.saveGState()
		context?.translateBy(x: -34, y: 200)
		context?.rotate(by: -45 * CGFloat(Float.pi) / 180)



		//// Rectangle Drawing
		let rectanglePath = UIBezierPath(rect: CGRect(x: 131, y: 0, width: 70, height: 70))
		UIColor.darkGray.setFill()
		rectanglePath.fill()


		//// Rectangle 2 Drawing
		let rectangle2Path = UIBezierPath(rect: CGRect(x: 131, y: 262, width: 70, height: 70))
		UIColor.darkGray.setFill()
		rectangle2Path.fill()


		//// Rectangle 3 Drawing
		let rectangle3Path = UIBezierPath(rect: CGRect(x: 0, y: 131, width: 70, height: 70))
		UIColor.darkGray.setFill()
		rectangle3Path.fill()


		//// Rectangle 4 Drawing
		let rectangle4Path = UIBezierPath()
		rectangle4Path.move(to: CGPoint(x: 261, y: 201))
		rectangle4Path.addLine(to: CGPoint(x: 331, y: 201))
		rectangle4Path.addLine(to: CGPoint(x: 331, y: 131))
		rectangle4Path.addLine(to: CGPoint(x: 261, y: 131))
		rectangle4Path.addLine(to: CGPoint(x: 261, y: 201))
		rectangle4Path.close()
		UIColor.darkGray.setFill()
		rectangle4Path.fill()



		context?.restoreGState()


		//// Oval Drawing
		let ovalPath = UIBezierPath(ovalIn: CGRect(x: 75, y: 75, width: 250, height: 250))
		UIColor.darkGray.setFill()
		ovalPath.fill()
		UIColor.darkGray.setStroke()
		ovalPath.lineWidth = 2
		ovalPath.stroke()


		//// Oval 2 Drawing
		let oval2Path = UIBezierPath(ovalIn: CGRect(x: 150, y: 150, width: 100, height: 100))
		UIColor.white.setFill()
		oval2Path.fill()
		UIColor.darkGray.setStroke()
		oval2Path.lineWidth = 2
		oval2Path.stroke()
	}

	open class func drawAppStore() {
		//// General Declarations
		let context = UIGraphicsGetCurrentContext()

		//// Rectangle Drawing
		let rectanglePath = UIBezierPath(roundedRect: CGRect(x: 112, y: 212, width: 800, height: 600), cornerRadius: 100)
		UIColor.white.setFill()
		rectanglePath.fill()
		UIColor.darkGray.setStroke()
		rectanglePath.lineWidth = 20
		rectanglePath.stroke()


		//// Text Drawing
		let textRect = CGRect(x: 464.81, y: 431.09, width: 392.75, height: 161.82)
		let textTextContent = NSString(string: "XXI")
		let textStyle = NSMutableParagraphStyle()
		textStyle.alignment = .left

		let textFontAttributes = [NSAttributedStringKey.font: UIFont(name: "Superclarendon-Regular", size: 175)!, NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.paragraphStyle: textStyle]

		let textTextHeight: CGFloat = textTextContent.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).size.height
		context?.saveGState()
		context?.clip(to: textRect)
		textTextContent.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
		context?.restoreGState()


		//// Rectangle 3 Drawing
		let rectangle3Path = UIBezierPath(roundedRect: CGRect(x: 464.56, y: 282, width: 393, height: 50), cornerRadius: 10)
		UIColor.lightGray.setFill()
		rectangle3Path.fill()


		//// Rectangle 4 Drawing
		let rectangle4Path = UIBezierPath(roundedRect: CGRect(x: 464.81, y: 692, width: 393, height: 50), cornerRadius: 10)
		UIColor.lightGray.setFill()
		rectangle4Path.fill()


		//// Group
		//// Oval Drawing
		let ovalPath = UIBezierPath(ovalIn: CGRect(x: 244.5, y: 384, width: 100, height: 100))
		UIColor.black.setFill()
		ovalPath.fill()


		//// Rectangle 5 Drawing
		let rectangle5Path = UIBezierPath(roundedRect: CGRect(x: 213.5, y: 476, width: 162, height: 260), byRoundingCorners: [UIRectCorner.topLeft, UIRectCorner.topRight], cornerRadii: CGSize(width: 25, height: 25))
		rectangle5Path.close()
		UIColor.black.setFill()
		rectangle5Path.fill()


		//// Rectangle 6 Drawing
		let rectangle6Path = UIBezierPath(roundedRect: CGRect(x: 244.5, y: 541.97, width: 10.5, height: 194.03), byRoundingCorners: [UIRectCorner.topLeft, UIRectCorner.topRight], cornerRadii: CGSize(width: 5.25, height: 5.25))
		rectangle6Path.close()
		UIColor.white.setFill()
		rectangle6Path.fill()


		//// Rectangle 7 Drawing
		let rectangle7Path = UIBezierPath(roundedRect: CGRect(x: 334.5, y: 541.97, width: 10, height: 194.03), byRoundingCorners: [UIRectCorner.topLeft, UIRectCorner.topRight], cornerRadii: CGSize(width: 5, height: 5))
		rectangle7Path.close()
		UIColor.white.setFill()
		rectangle7Path.fill()




		//// Rectangle 2 Drawing
		let rectangle2Path = UIBezierPath(roundedRect: CGRect(x: 182, y: 282, width: 225, height: 460), cornerRadius: 25)
		UIColor.gray.setStroke()
		rectangle2Path.lineWidth = 20
		rectangle2Path.stroke()
	}

	open class func drawSafariStepIcon(stepSize: CGSize = CGSize(width: 40, height: 40)) {
		//// General Declarations
		let context = UIGraphicsGetCurrentContext()

		//// Symbol Drawing
		let symbolRect = CGRect(x: 0, y: 0, width: stepSize.width, height: stepSize.height)
		context?.saveGState()
		UIRectClip(symbolRect)
		context?.translateBy(x: symbolRect.origin.x, y: symbolRect.origin.y)
		context?.scaleBy(x: symbolRect.size.width / 400, y: symbolRect.size.height / 400)

		ProceduralImages.drawLargeSafari()
		context?.restoreGState()
	}

	open class func drawSettingsStepIcon(stepSize: CGSize = CGSize(width: 40, height: 40)) {
		//// General Declarations
		let context = UIGraphicsGetCurrentContext()

		//// Symbol Drawing
		let symbolRect = CGRect(x: 0, y: 0, width: stepSize.width, height: stepSize.height)
		context?.saveGState()
		UIRectClip(symbolRect)
		context?.translateBy(x: symbolRect.origin.x, y: symbolRect.origin.y)
		context?.scaleBy(x: symbolRect.size.width / 400, y: symbolRect.size.height / 400)

		ProceduralImages.drawLargeSettings()
		context?.restoreGState()
	}

	open class func drawContentBlockerStepIcon(stepSize: CGSize = CGSize(width: 40, height: 40)) {
		//// General Declarations
		let context = UIGraphicsGetCurrentContext()

		//// Symbol Drawing
		let symbolRect = CGRect(x: 0, y: 0, width: stepSize.width, height: stepSize.height)
		context?.saveGState()
		UIRectClip(symbolRect)
		context?.translateBy(x: symbolRect.origin.x, y: symbolRect.origin.y)
		context?.scaleBy(x: symbolRect.size.width / 400, y: symbolRect.size.height / 400)

		ProceduralImages.drawLargeContentBlocker()
		context?.restoreGState()
	}

	open class func drawTwentyOneStepIcon(stepSize: CGSize = CGSize(width: 40, height: 40)) {
		//// General Declarations
		let context = UIGraphicsGetCurrentContext()

		//// Symbol Drawing
		let symbolRect = CGRect(x: 0, y: 0, width: stepSize.width, height: stepSize.height)
		context?.saveGState()
		UIRectClip(symbolRect)
		context?.translateBy(x: symbolRect.origin.x, y: symbolRect.origin.y)
		context?.scaleBy(x: symbolRect.size.width / 1024, y: symbolRect.size.height / 1024)

		ProceduralImages.drawAppStore()
		context?.restoreGState()
	}

	open class func drawTwentyOneHeaderIcon(headerSize: CGSize = CGSize(width: 128, height: 128)) {
		//// General Declarations
		let context = UIGraphicsGetCurrentContext()

		//// Symbol Drawing
		let symbolRect = CGRect(x: 0, y: 0, width: headerSize.width, height: headerSize.height)
		context?.saveGState()
		UIRectClip(symbolRect)
		context?.translateBy(x: symbolRect.origin.x, y: symbolRect.origin.y)
		context?.scaleBy(x: symbolRect.size.width / 1024, y: symbolRect.size.height / 1024)
		
		ProceduralImages.drawAppStore()
		context?.restoreGState()
	}
	
}
