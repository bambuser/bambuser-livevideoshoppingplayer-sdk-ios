//
//  DemoApp.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI
import BambuserLiveVideoShoppingPlayer

@main
struct DemoApp: App {
    @Environment(\.scenePhase) var scenePhase

    @State private var settings = DemoSettings()
    
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environmentObject(settings)
                .onChange(of: scenePhase) { newPhase in
                    if newPhase == .active {
                        if settings.shouldRestorePiPAutomatically && PictureInPictureState.shared.isPictureInPictureActive {
                            PictureInPictureState.shared.restorePlayer()
                        }
                    }
                }
        }
    }
}
