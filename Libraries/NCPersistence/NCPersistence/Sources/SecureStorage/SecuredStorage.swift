//
//  Logger.swift
//  Networking
//
//  Created by Chinh Phung on 5/22/24
//

import Foundation

public protocol SecuredStorage {
    
    func clear()
    
    func set(_ data: Data, key: SecuredStorageKey)
    func getData(key: SecuredStorageKey) -> Data?
    func remove(key: SecuredStorageKey)
    
    func set(_ value: String, key: SecuredStorageKey)
    func getValue(key: SecuredStorageKey) -> String?
    
    func set<T: Codable>(_ object: T, key: SecuredStorageKey)
    func get<T: Codable>(key: SecuredStorageKey) -> T?
}

public struct SecuredStorageKey {
    
    let name: String
    
    public init(_ name: String) {
        self.name = name
    }
    
    public func getKeyName() -> String {
        return self.name
    }
}
