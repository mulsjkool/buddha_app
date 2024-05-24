//
//  Error+Extension.swift
//  NCCommon
//
//  Created by Chinh Phung on 9/21/21.
//

public extension Error {
    var isUnauthorized: Bool {
        (self as NSError).code == 401
    }
}
