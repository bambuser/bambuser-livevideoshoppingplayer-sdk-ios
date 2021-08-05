//
//  DemoApp.swift
//  BambuserLiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI
import BambuserLiveVideoShoppingPlayer

@main
struct DemoApp: App {
    
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environmentObject(DemoContext())
        }
    }
}
