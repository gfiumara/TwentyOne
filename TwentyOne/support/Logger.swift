/*
 * Logger.swift
 * Part of http://github.com/gfiumara/TwentyOne by Gregory Fiumara.
 * See LICENSE for details.
 */

import Foundation
import os

public struct Logger
{
	static let log = OSLog(subsystem:Constants.AppGroupID, category:"debug")

	public static func log(_ message:String, file:String = #file, function:String = #function, line:Int = #line)
	{
		os_log("%@|%d: %@", log:log, type:.debug, function, line, message)
	}
}
