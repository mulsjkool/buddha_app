//
//  DisableLocalCachePlugin.swift
//  NCNetworking
//
//  Created by Chinh Phung on 5/22/24
//

import Moya

public struct DisableLocalCachePlugin: PluginType {

    public init() {}

    public func prepare(_ request: URLRequest, target _: TargetType) -> URLRequest {
        var request = request
        request.cachePolicy = .reloadIgnoringLocalCacheData

        return request
    }
}
