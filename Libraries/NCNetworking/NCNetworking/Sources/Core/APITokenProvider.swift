//
//  APITokenProvider.swift
//  NCNetworking
//
//  Created by Chinh Phung on 9/27/21.
//

public protocol APITokenProvider {
    func getAccessToken() -> String?
//    func setAccessToken(_ token: String)
//    func removeAccessToken()
}
