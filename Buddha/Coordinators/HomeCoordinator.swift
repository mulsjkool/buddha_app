//
//  HomeCoordinator.swift
//  Buddha
//
//  Created by Phung Chinh on 22/5/24.
//

import Foundation
import Stinsen
import SwiftUI

final class HomeCoordinator: NavigationCoordinatable {
    
    var stack: Stinsen.NavigationStack<HomeCoordinator> = .init(initial: \HomeCoordinator.start)
    
    @Root var start = startView
    
    @ViewBuilder func startView() -> some View {
        ContentView()
    }
}

final class CustomCoordinator: NavigationCoordinatable {
    
    var stack: Stinsen.NavigationStack<CustomCoordinator> = .init(initial: \CustomCoordinator.start)
    
    @Root var start = startView
    
    @ViewBuilder func startView() -> some View {
        ContentView()
    }
}
