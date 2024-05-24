//
//  RepositoryContainers.swift
//  Buddha
//
//  Created by Phung Chinh on 21/5/24.
//

import Foundation
import Factory

final class RepositoryContainers: SharedContainer {
    static let shared = RepositoryContainers()
    let manager = ContainerManager()
}
