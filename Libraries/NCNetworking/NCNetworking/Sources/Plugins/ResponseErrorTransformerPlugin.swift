//
//  ResponseErrorTransformerPlugin.swift
//  NCNetworking
//
//  Created by Chinh Phung on 5/22/24
//

import Moya

public struct ResponseErrorTransformer: PluginType {

    public init() {}

    public func process(_ result: Result<Moya.Response, Moya.MoyaError>,
                        target _: TargetType) -> Result<Moya.Response, Moya.MoyaError> {
        switch result {
        case let .success(response):
            guard let responseJSON = try? JSONSerialization.jsonObject(with: response.data, options: JSONSerialization.ReadingOptions.mutableLeaves) as? [String: Any] else { return result }
            
            let metaPath = NetworkingConfig.Response.metaPath
            guard let responseMetadataJSON = responseJSON[metaPath] as? [String: Any],
                let metadata = try? JSONSerialization.data(withJSONObject: responseMetadataJSON, options: .prettyPrinted) else {
                    return result
            }

            guard let responseMetadata = try? JSONDecoder().decode(ResponseMetadata.self, from: metadata) else {
                return result
            }
            guard let error = ResponseError(httpCode: response.statusCode, metadata: responseMetadata) else {
                return result
            }
            return Result.failure(MoyaError.underlying(error, response))

        case .failure:
            return result
        }
    }
}
