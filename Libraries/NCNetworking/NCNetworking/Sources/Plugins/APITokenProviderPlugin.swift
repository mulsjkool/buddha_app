//
//  APITokenProviderPlugin.swift
//  NCNetworking
//
//  Created by Chinh Phung on 9/27/21.
//

import Moya

public struct APITokenProviderPlugin: PluginType {

    private let tokenProvider: APITokenProvider

    public init(tokenProvider: APITokenProvider) {
        self.tokenProvider = tokenProvider
    }

    // MARK: - PluginType conformance

    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard let target = target.rawTarget as? AuthenticatableTargetType else { return request }
        var token: String? = nil
        switch target.authorization {
        case .accessToken:
            token = tokenProvider.getAccessToken()
        default:
            return request
        }
        guard let token = token, !token.isEmpty else { return request }
        var request = request
        let requestToken = "Bearer \(token)"
        request.addValue(requestToken, forHTTPHeaderField: NetworkingConfig.Request.Header.authorization)

        return request
    }
}
