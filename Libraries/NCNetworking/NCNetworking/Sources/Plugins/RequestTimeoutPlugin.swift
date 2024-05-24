//
//  RequestTimeoutPlugin.swift
//  NCNetworking
//
//  Created by Chinh Phung on 5/22/24
//

import Moya

public enum RequestTimeoutLevel: Double {
    case `default` = 0
    case level1 = 5.0
    case level2 = 15.0
    case level3 = 30.0
    case level4 = 60.0
    case level5 = 90.0
}

public protocol RequestTimeoutConfigurable {
    var timeoutLevel: RequestTimeoutLevel { get }
}

public struct RequestTimeoutPlugin: PluginType {
    
    public init() {}
    
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard let target = target.rawTarget as? RequestTimeoutConfigurable else { return request }
        guard target.timeoutLevel != .default else { return request }
        var request = request
        request.timeoutInterval = target.timeoutLevel.rawValue
        return request
    }
}
