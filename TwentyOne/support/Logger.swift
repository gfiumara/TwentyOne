/*
 * Logger.swift
 * Part of http://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import Foundation

public struct Logger
{
	#if DEBUG
	public static var enabled:Bool = true
	#else
	public static var enabled:Bool = false
	#endif

	public static func log(message:String, file:String = __FILE__, function:String = __FUNCTION__, line:Int = __LINE__)
	{
		if !Logger.enabled {
			return
		}

		print("\(function)|\(line): \(message)")
	}
}
