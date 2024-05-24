//
//  CoordinatorContainers.swift
//  Buddha
//
//  Created by Phung Chinh on 22/5/24.
//

import Foundation
import Factory

final class CoordinatorContainers: SharedContainer {
    static let shared = CoordinatorContainers()
    let manager = ContainerManager()
}

extension CoordinatorContainers {
    
    var mainTabbarCoordinator: Factory<MainTabbarCoordinator> {
        self { MainTabbarCoordinator() }
    }
    
    var homeCoordinator: Factory<HomeCoordinator> {
        self { HomeCoordinator() }
    }
    
    var customCoordinator: Factory<CustomCoordinator> {
        self { CustomCoordinator() }
    }
}
