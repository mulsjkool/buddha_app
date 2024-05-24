//
//  NetworkingConfig.swift
//  Networking
//
//  Created by Chinh Phung on 5/22/24
//

public enum NetworkingConfig {

    public static var isLoggingEnabled: Bool = true

    public enum Response {
        public static let dataPath = "data"
        public static let metaPath = "meta"
        public static let errorPath = "error"
        public static let unauthorizedCode = 401
    }

    public enum Request {

        public enum Header {
            public static let authorization = "Authorization"
        }
    }
}
