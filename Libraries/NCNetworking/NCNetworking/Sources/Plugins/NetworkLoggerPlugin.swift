//
//  NetworkLoggerPlugin.swift
//  NCNetworking
//
//  Created by Chinh Phung on 5/22/24
//

import Moya
import os

extension NetworkLoggerPlugin {
    
    public static let networkConfiguration: Configuration =
        Configuration(output: { (targetType, strings) in defaultOutput(target: targetType, items: strings) },
                      logOptions: .verbose)

    public static func defaultOutput(target: TargetType, items: [String]) {
        for item in items {
            OSLog.log(item.replacingOccurrences(of: "\n", with: ""))
        }
    }
}

extension OSLog {
    private static let log = OSLog(subsystem: "Moya.Logger", category: "networking")

    static func log(_ message: String, log: OSLog = log, type: OSLogType = .debug) {
        #if DEBUG
        os_log("%@", log: log, type: type, message)
        #endif
    }
}
