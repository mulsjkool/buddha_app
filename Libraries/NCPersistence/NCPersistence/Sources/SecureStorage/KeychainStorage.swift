//
//  KeychainAccess.swift
//  Networking
//
//  Created by Chinh Phung on 5/22/24
//

import KeychainAccess

public class KeychainStorage {
    
    public static let `default` = KeychainStorage()
    
    private let keychain: Keychain
    
    private lazy var encoder = JSONEncoder()
    private lazy var decoder = JSONDecoder()
    
    public init(configuration: Configuration = .default) {
        self.keychain = Keychain(service: configuration.service)
    }
}

extension KeychainStorage: SecuredStorage {
    
    public func clear() {
        try? keychain.removeAll()
    }
    
    public func set(_ data: Data, key: SecuredStorageKey) {
        try? keychain.set(data, key: key.name)
    }
    
    public func getData(key: SecuredStorageKey) -> Data? {
        try? keychain.getData(key.name)
    }
    
    public func remove(key: SecuredStorageKey) {
        try? keychain.remove(key.name)
    }
    
    public func set(_ value: String, key: SecuredStorageKey) {
        try? keychain.set(value, key: key.name)
    }
    
    public func getValue(key: SecuredStorageKey) -> String? {
        try? keychain.get(key.name)
    }
    
    public func set<T: Codable>(_ object: T, key: SecuredStorageKey) {
        guard let data = try? encoder.encode(object) else { return }
        set(data, key: key)
    }
    
    public func get<T: Codable>(key: SecuredStorageKey) -> T? {
        guard let data = getData(key: key) else { return nil }
        return try? decoder.decode(T.self, from: data)
    }
}

// MARK: Configuration

extension KeychainStorage {
    
    public struct Configuration {
        
        let service: String
        
        public init() {
            guard let bundleId = Bundle.main.bundleIdentifier else { fatalError("Cannot get Bundle ID for: Bundle.main") }
            self.service = bundleId
        }
        
        public init(service: String) {
            self.service = service
        }
        
        public static var `default`: Configuration { Configuration() }
    }
}
