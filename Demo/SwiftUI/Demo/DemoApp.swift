//
//  DemoApp.swift
//  LiveShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI
import BambuserLiveShoppingPlayer

@main
struct DemoApp: App {
        
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environmentObject(DemoContext())
        }
    }
}
