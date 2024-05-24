//
//  ResponseMetadata.swift
//  NCNetworking
//
//  Created by Chinh Phung on 9/15/21.
//

public struct ResponseMetadata: Decodable {
    let code: String
    let message: String?

    enum CodingKeys: String, CodingKey {
        case message = "message"
        case code = "code"
    }
}
