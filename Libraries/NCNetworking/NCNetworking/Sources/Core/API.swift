//
//  API.swift
//  Networking
//
//  Created by Chinh Phung on 5/22/24
//

import Alamofire
import Moya
import Combine

public protocol APIType {
    // Request networking API
    func request(target: TargetType) -> AnyPublisher<Response, MoyaError>

//     Request networking API with JWT Token. This will always trigger refresh token API when getting unauthorize errors.
//    func authenticateRequest(target: TargetType) -> Single<Response>
//
//    // Request networking API with JWT Token.
//    func authenticateRequest(target: AuthenticatableTargetType, refreshTokenOnFailure: Bool) -> Single<Response>
    
    func authenticateRequestWithProgress(target: TargetType) -> AnyPublisher<ProgressResponse, MoyaError>
}

public extension APIType {
    func authenticateRequestWithProgress(target: TargetType) -> AnyPublisher<ProgressResponse, MoyaError> {
        return Just(ProgressResponse()).setFailureType(to: MoyaError.self)
            .eraseToAnyPublisher()
    }
}

public protocol APIErrorPreprocessing {
    func isUnauthorizedError(_ error: Error) -> Bool
}

open class API: APIType {
    public static let `default`: API = API(provider: APIProvider.default)

    public static let defaultWithoutCache: API = API(provider: APIProvider.defaultWithoutCache)

    // MARK: - Dependencies

    private let provider: MoyaProvider<MultiTarget>
    private let errorPreprocessor: APIErrorPreprocessing

    // MARK: - Init

    public init(provider: MoyaProvider<MultiTarget>, errorPreprocessor: APIErrorPreprocessing = DefaultErrorProcessor()) {
        self.provider = provider
        self.errorPreprocessor = errorPreprocessor
    }

    open func request(target: TargetType) -> AnyPublisher<Response, MoyaError> {
        provider
            .requestPublisher(MultiTarget(target))
            .filterSuccessfulStatusCodes()
    }

    open func authenticateRequestWithProgress(target: TargetType) -> AnyPublisher<ProgressResponse, MoyaError> {
        provider.requestWithProgressPublisher(MultiTarget(target))
    }
}

// MARK: - Default MoyaProvider for API

public class APIProvider: MoyaProvider<MultiTarget> {

    public static let `default`: APIProvider = APIProvider()
    public static let defaultWithoutCache = APIProvider(allowCache: false)

    public static var plugins: [PluginType] {
        [
            ResponseErrorTransformer(),
            RequestTimeoutPlugin(),
        ]
    }

    public init(endpointClosure: @escaping EndpointClosure = MoyaProvider<MultiTarget>.defaultEndpointMapping,
                requestClosure: @escaping RequestClosure = MoyaProvider<MultiTarget>.defaultRequestMapping,
                stubClosure: @escaping StubClosure = MoyaProvider.neverStub,
                callbackQueue: DispatchQueue? = nil,
                plugins: [PluginType] = APIProvider.plugins,
                trackInflights: Bool = false,
                allowCache: Bool = true) {

        let secureManager = SecureSessionManager(allowCache: allowCache, startRequestsImmediately: false)

        var apiPlugins: [PluginType] = plugins

        if NetworkingConfig.isLoggingEnabled {
            let loggerPlugin = NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.networkConfiguration)
            apiPlugins.append(loggerPlugin)
        } else {
            plugins
                .compactMap { plugin in
                    plugin as? NetworkLoggerPlugin
                }
                .forEach { plugin in
                    apiPlugins.removeElement(plugin)
                }
        }

        if allowCache {
            apiPlugins.append(DisableLocalCachePlugin())
        }

        super.init(endpointClosure: endpointClosure,
                   requestClosure: requestClosure,
                   stubClosure: stubClosure,
                   callbackQueue: callbackQueue,
                   session: secureManager,
                   plugins: apiPlugins,
                   trackInflights: trackInflights)
    }
}

private extension Array {
    mutating func removeElement(_ element: Element) {
        guard let objIndex = firstIndex(where: { $0 as AnyObject === element as AnyObject }) else {
            return
        }
        remove(at: objIndex)
    }
}

public final class DefaultErrorProcessor: APIErrorPreprocessing {
    public init() {}
    
    public func isUnauthorizedError(_ error: Error) -> Bool {
        let unauthorizedCode = NetworkingConfig.Response.unauthorizedCode // Error code 401
        guard let moyaError = error as? MoyaError else { return false }
        return moyaError.responseError?.httpCode == unauthorizedCode
    }
}
