//
//  APIContainers.swift
//  Buddha
//
//  Created by Phung Chinh on 21/5/24.
//

import Foundation
import Factory

final class APIContainers: SharedContainer {
    static let shared = APIContainers()
    let manager = ContainerManager()
    
}
