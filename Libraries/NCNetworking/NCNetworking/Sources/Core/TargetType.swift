//
//  TargetType.swift
//  Networking
//
//  Created by Chinh Phung on 5/22/24
//

import Moya

public protocol LocalizableTarget {
    var locale: Locale { get }
}

public enum AuthorizationMethod: String {
    case none
    case accessToken
}

public protocol AuthenticatableTargetType: TargetType {
    var authorization: AuthorizationMethod { get }
}

public protocol BaseURLConfigurable: TargetType {
    var custombaseURL: String { get }
}

public extension TargetType {

    var headers: [String: String]? {
        return nil
    }
    
    var urlParameters: [String: Any]? {
        return nil
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var validate: Bool {
        return false
    }
}
