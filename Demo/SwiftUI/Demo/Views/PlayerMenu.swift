//
//  PlayerMenu.swift
//  BambuserLiveVideoShoppingPlayer
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
    @Binding var isPipEnabled: Bool
    
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject private var demoContext: DemoContext
    
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
        let showId = demoContext.loadNextShow()
        playerInterface?.loadShow(showId)
    }
    
    func togglePip() {
        withAnimation {
            isPipEnabled.toggle()
            let function: PlayerFunction = isPipEnabled ? .hideUI : .showUI
            playerInterface?.callFunction(function) { _ in }
        }
    }
}

struct PlayerMenu_Previews: PreviewProvider {
    
    static var previews: some View {
        PlayerMenu(
            playerContext: .shared,
            showCloseButton: true,
            isPipEnabled: .constant(true))
            .environmentObject(DemoContext())
    }
}
