//
//  Logger.swift
//  Networking
//
//  Created by Chinh Phung on 5/22/24
//

public enum Logger {

    public static func error(_ message: @autoclosure () -> Any, isFatal: Bool = false) {
        #if DEBUG
        print(message())
        let isRunningTests = NSClassFromString("XCTestCase") != nil
        if isFatal, !isRunningTests {
            fatalError("\(message())")
        }
        #endif
    }

    public static func debug(_ message: @autoclosure () -> Any, isFatal: Bool = false) {
        #if DEBUG
        print(message())
        let isRunningTests = NSClassFromString("XCTestCase") != nil
        if isFatal, !isRunningTests {
            fatalError("\(message())")
        }
        #endif
    }

    public static func info(_ message: @autoclosure () -> Any) {
        #if DEBUG
        print(message())
        #endif
    }
}
