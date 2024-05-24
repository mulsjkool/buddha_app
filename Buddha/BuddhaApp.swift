//
//  BuddhaApp.swift
//  Buddha
//
//  Created by Phung Chinh on 21/5/24.
//

import SwiftUI

@main
struct BuddhaApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabbarCoordinator().view()
        }
    }
}
