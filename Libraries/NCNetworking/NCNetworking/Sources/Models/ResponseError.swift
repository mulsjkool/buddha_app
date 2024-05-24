//
//  ResponseError.swift
//  NCNetworking
//
//  Created by Chinh Phung on 9/15/21.
//

import Moya

public class ResponseError: Error {
    public let httpCode: Int
    public let code: String
    public let message: String?

    public init(httpCode: Int, code: String, message: String) {
        self.httpCode = httpCode
        self.message = message
        self.code = code
    }

    public init?(httpCode: Int, metadata: ResponseMetadata) {
        if 200...299 ~= httpCode { return nil }
        self.httpCode = httpCode
        self.code = metadata.code
        self.message = metadata.message
    }
}

extension ResponseError: Equatable {
    public static func == (lhs: ResponseError, rhs: ResponseError) -> Bool {
        guard lhs.code == rhs.code,
            lhs.httpCode == rhs.httpCode,
            lhs.message == rhs.message else {
            return false
        }
        return true
    }
}

extension MoyaError {
    public var responseError: ResponseError? {
        guard case .underlying(let error, _) = self else { return nil }
        guard let responseError = error as? ResponseError else { return nil }
        return responseError
    }
}
