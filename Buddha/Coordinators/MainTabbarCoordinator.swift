//
//  MainTabbarCoordinator.swift
//  Buddha
//
//  Created by Phung Chinh on 22/5/24.
//

import Foundation
import Stinsen
import SwiftUI
import Factory

final class MainTabbarCoordinator: TabCoordinatable {
        
    var homeCoordinator = CoordinatorContainers.shared.homeCoordinator
    var customCoordinator = CoordinatorContainers.shared.customCoordinator
    
    var child: Stinsen.TabChild
    
    init() {
        child = TabChild(startingItems: [\MainTabbarCoordinator.homeCoordinator, \MainTabbarCoordinator.customCoordinator], activeTab: 0)
    }
    
}
