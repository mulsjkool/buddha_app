//
//  SecureSessionManager.swift
//  NCNetworking
//
//  Created by Chinh Phung on 5/22/24
//

import Alamofire
import Moya

public final class SecureSessionManager: Session {

    public convenience init(allowCache: Bool, startRequestsImmediately: Bool) {
        let configuration = URLSessionConfiguration.default
        configuration.headers = HTTPHeaders.default

        if !allowCache {
            configuration.urlCache = nil
        }
        
        self.init(configuration: configuration, startRequestsImmediately: startRequestsImmediately)
    }
}
