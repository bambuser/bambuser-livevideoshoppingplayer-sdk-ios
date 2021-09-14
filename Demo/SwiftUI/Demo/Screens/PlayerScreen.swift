//
//  PlayerScreen.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI
import BambuserLiveVideoShoppingPlayer

struct PlayerScreen: View {
    
    let showCloseButton: Bool
    
    @StateObject private var playerContext = LiveVideoShoppingPlayerContext.shared
    
    var body: some View {
        ZStack {
            BambuserLogoBackground()
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
        PlayerMenu(
            playerContext: playerContext,
            showCloseButton: showCloseButton)
            .asOverlay()
            .padding(5)
    }
    
    var player: some View {
        Player(playerContext: playerContext)
            .cornerRadius(7)
            .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 2)
    }
}


struct PlayerScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        PlayerScreen(showCloseButton: false)
    }
}
