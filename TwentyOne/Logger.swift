//
//  Logger.swift
//  TwentyOne
//
//  Created by Greg Fiumara on 11/12/15.
//  Copyright © 2015 Greg Fiumara. All rights reserved.
//

import Foundation

public struct Logger
{
	#if DEBUG
	public static var enabled:Bool = true
	#else
	public static var enabled:Bool = false
	#endif

	public static func log(message:String, function:String = __FUNCTION__, line:Int = __LINE__)
	{
		if !Logger.enabled {
			return
		}

		print("\(function)|\(line): \(message)")
	}
}
