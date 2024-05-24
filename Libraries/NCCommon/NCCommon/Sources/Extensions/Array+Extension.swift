//
//  Array+Extension.swift
//  NCCommon
//
//  Created by Chinh Phung on 9/21/21.
//

extension Array {
    public func distinct<T: Hashable>(by keyForValue: (Element) -> T) -> Self {
        var currentElements = [T: Bool]()
        var result = Self()
        forEach { element in
            if currentElements[keyForValue(element)] != true {
                result.append(element)
                currentElements[keyForValue(element)] = true
            }
        }
        return result
    }
}
