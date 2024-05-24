//
//  ReachabilityService.swift
//  Networking
//
//  Created by Chinh Phung on 5/22/24
//

import Reachability
import Combine
import CombineExt

public enum ReachabilityStatus {
    case reachable(viaWiFi: Bool)
    case unreachable
}

extension ReachabilityStatus {

    public var reachable: Bool {
        switch self {
        case .reachable:
            return true
        case .unreachable:
            return false
        }
    }
}

public protocol ReachabilityService {
    var reachability: AnyPublisher<ReachabilityStatus, Error> { get }
}

public enum ReachabilityServiceError: Error {
    case failedToCreate
}

public class DefaultReachabilityService: ReachabilityService {
    
    public static let `default`: DefaultReachabilityService = {
        do {
            return try DefaultReachabilityService()
        } catch {
            fatalError(String(describing: error))
        }
    }()

    public var reachability: AnyPublisher<ReachabilityStatus, Error> {
        return _reachabilitySubject.eraseToAnyPublisher()
    }

    private let _reachabilitySubject: ReplaySubject<ReachabilityStatus, Error>
    private let _reachability: Reachability

    public init() throws {
        guard let reachabilityRef = try? Reachability() else { throw ReachabilityServiceError.failedToCreate }
        let reachabilitySubject = ReplaySubject<ReachabilityStatus, Error>(bufferSize: 1)
        let backgroundQueue = DispatchQueue(label: "reachability.wificheck")

        reachabilityRef.whenReachable = { _ in
            backgroundQueue.async {
                reachabilitySubject.send(.reachable(viaWiFi: reachabilityRef.connection == .wifi))
            }
        }

        reachabilityRef.whenUnreachable = { _ in
            backgroundQueue.async {
                reachabilitySubject.send(.unreachable)
            }
        }

        try reachabilityRef.startNotifier()
        _reachability = reachabilityRef
        _reachabilitySubject = reachabilitySubject
    }

    deinit {
        _reachability.stopNotifier()
    }
}
