//
//  PlayerMenu.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI
import BambuserLiveVideoShoppingPlayer

/**
 This is a demo-specific menu, that can be used to control a
 demo-specific player. Only use it for inspiration.
 */
struct PlayerMenu: View {
    
    let playerContext: LiveVideoShoppingPlayerContext
    let showCloseButton: Bool
    
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject private var settings: DemoSettings
    
    var body: some View {
        HStack {
            button(.next, action: loadNextShow)
            button(pipImage, action: togglePip)
            if showCloseButton {
                button(.close, action: dismiss)
            }
        }
    }
}


// MARK: - Modifiers

extension PlayerMenu {
    
    /**
     Using this modifier embeds the menu in a dark container
     view that is intended to "float" above the player.
     */
    func asOverlay() -> some View {
        self.accentColor(.white)
            .padding(5)
            .font(.title2.weight(.regular))
            .background(Color.black)
            .clipShape(Capsule())
            .shadow(color: .black.opacity(0.4), radius: 4, x: 0, y: 3)
    }
}


// MARK: - Private logic

private extension PlayerMenu {
    
    var isPipEnabled: Bool {
        playerContext.interface?.isPictureInPictureActive ?? false
    }
    
    var pipImage: Image {
        isPipEnabled ? .pipExit : .pipEnter
    }
    
    var playerInterface: LiveVideoShoppingPlayerInterface? {
        playerContext.interface
    }
    
    func button(_ image: Image, action: @escaping () -> Void) -> some View {
        Button(action: action) { image }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func loadNextShow() {
        let showId = settings.loadNextShow()
        playerInterface?.loadShow(showId)
    }
    
    func togglePip() {
        withAnimation {
            playerInterface?.togglePictureInPicture()
        }
    }
}

struct PlayerMenu_Previews: PreviewProvider {
    
    static var previews: some View {
        PlayerMenu(
            playerContext: .shared,
            showCloseButton: true)
            .environmentObject(DemoSettings())
    }
}
