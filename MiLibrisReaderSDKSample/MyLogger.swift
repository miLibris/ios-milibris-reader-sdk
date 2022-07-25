//
//  MyLogger.swift
//  MiLibrisReaderSDKSample
//
//  Created by Maxime Le Moine on 28/07/2022.
//

import Foundation
import MiLibrisReaderSDK

class MyLogger: LoggerType {

    static func log(_ message: String, file: String, function: String, line: Int, level: LogLevel) {
        print("[MYLOGGER] \(level.emoji) \(message)")
    }

}
