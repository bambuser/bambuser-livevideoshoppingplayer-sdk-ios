//
//  PlayerScreen.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI
import BambuserLiveVideoShoppingPlayer

/**
 This screen is responsible for creating a player view, with
 support for both push, sheet and full modal navigation. The
 screen overlays the player with a demo-specific player menu.
 */
struct PlayerScreen: View {
    
    let showCloseButton: Bool
    
    @StateObject private var playerContext = LiveVideoShoppingPlayerContext.shared
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topTrailing) {
                player
                menu
            }.padding(5)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}


// MARK: - View logic

private extension PlayerScreen {
    
    var menu: some View {
        DemoPlayerMenu(
            playerContext: playerContext,
            showCloseButton: showCloseButton)
            .asOverlay()
            .padding(5)
    }
    
    var player: some View {
        DemoPlayer(playerContext: playerContext)
            .background(BambuserLogoBackground())
            .cornerRadius(7)
            .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 2)
    }
}


struct PlayerScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        PlayerScreen(showCloseButton: false)
    }
}
