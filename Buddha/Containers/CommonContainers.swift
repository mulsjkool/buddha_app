//
//  CommonContainers.swift
//  Buddha
//
//  Created by Phung Chinh on 21/5/24.
//

import Foundation
import Factory

final class CommonContainers: SharedContainer {
    static let shared = CommonContainers()
    let manager = ContainerManager()
}
