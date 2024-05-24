//
//  ServiceContainers.swift
//  Buddha
//
//  Created by Phung Chinh on 21/5/24.
//

import Foundation
import Factory

final class ServiceContainers: SharedContainer {
    
    static let shared = ServiceContainers()
    let manager = ContainerManager()
    
}
