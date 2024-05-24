//
//  ErrorHandling.swift
//  NCNetworking
//
//  Created by Chinh Phung on 9/24/21.
//

import Combine

public protocol DeepErrorMappable: Error {
    init?(code: Int)
    init?(code: String)
}

extension DeepErrorMappable {
    public init?(code _: Int) {
        return nil
    }

    public init?(code _: String) {
        return nil
    }
}

public protocol DeepError: DeepErrorMappable {}

public protocol ErrorHandlable {
    var allErrors: PassthroughSubject<Error, Error> { get }
    
    func configureDeepError<ErrorType: DeepError>(type: ErrorType.Type, when condition: @escaping () -> Bool, handler: @escaping (ErrorType) -> Void)
}
