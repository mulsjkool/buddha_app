//
//  Moya+Extensions.swift
//  NCNetworking
//
//  Created by Chinh Phung on 9/24/21.
//

import Moya

public protocol HasUnderlyingError: Error {
    var underlyingError: Error? { get }
}

extension MoyaError: HasUnderlyingError {

    public var underlyingError: Error? {
        switch self {
        case .underlying(let error, _):
            return error
        default:
            return nil
        }
    }
}

public extension TargetType {

    var rawTarget: TargetType {

        if let multiTarget = self as? MultiTarget {
            return multiTarget.target
        }
        return self
    }
}
