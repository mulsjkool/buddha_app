//
//  Optional+Extension.swift
//  NCCommon
//
//  Created by Chinh Phung on 9/20/21.
//

public extension Optional {
    func `or`(_ value: Wrapped?) -> Optional {
        return self ?? value
    }

    func `or`(_ value: Wrapped) -> Wrapped {
        return self ?? value
    }
}
