//
//  PlayerScreen.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI
import BambuserLiveVideoShoppingPlayer

struct PlayerScreen: View {
    
    @State private var addToCalendarUrl: URL?
    @State private var isAddToCalendarSheetActive = false
    @State private var isPipEnabled = false
    
    @StateObject private var playerContext = LiveVideoShoppingPlayerContext()
    
    @EnvironmentObject private var demoContext: DemoContext
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            playerPipWrapper
            buttons
        }
        .padding()
    }
}


// MARK: - View logic

private extension PlayerScreen {
    
    var buttons: some View {
        HStack {
            Button(action: dismiss) { Image.close }
            Button(action: next) { Image.next }
            Button(action: togglePip) { pipButtonImage }
        }.font((Font.title.weight(.light)))
    }
    
    var pipButtonImage: Image {
        isPipEnabled ? .pipExit : .pipEnter
    }
    
    var player: some View {
        LiveVideoShoppingPlayer(
            showId: demoContext.showId,
            configuration: demoContext.playerConfiguration { event, data in
                switch event {
                case .addShowToCalendar: handleAddToCalendarEvent(data: data)
                case .playerClosed: dismiss()
                default: print("event: \(event), data: \(data)")
                }
            },
            context: playerContext
        )
        .cornerRadius(5)
        .sheet(isPresented: $isAddToCalendarSheetActive) {
            if let url = addToCalendarUrl {
                ShareSheet(activityItems: [url])
            } else {
                Text("Missing share url")
            }
        }
        // .overlay(Color.red.opacity(0.2))
    }
    
    var playerPipWrapper: some View {
        Color.clear.overlay(
            player.playerFrame(isPipEnabled: isPipEnabled),
            alignment: .bottomTrailing
        )
    }
    
    var spinner: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
    }
}


// MARK: - Private Functions

private extension PlayerScreen {
    
    var playerInterface: LiveVideoShoppingPlayerInterface? {
        playerContext.interface
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func handleAddToCalendarEvent(data: [String: Any]) {
        guard
            demoContext.nativeAddToCalendarSheet,
            let urlString = data["url"] as? String,
            let url = URL(string: urlString)
        else { return }
        self.addToCalendarUrl = url
        self.isAddToCalendarSheetActive = true
    }
    
    func enterPip() {
        playerInterface?.callFunction(.hideUI) { _ in }
        isPipEnabled = true
    }
    
    func exitPip() {
        playerInterface?.callFunction(.showUI) { _ in }
        isPipEnabled = false
    }
    
    func next() {
        let showId = demoContext.loadNextShow()
        playerInterface?.loadShow(showId)
    }
    
    func togglePip() {
        withAnimation {
            isPipEnabled ? exitPip() : enterPip()
        }
    }
}


// MARK: - LiveVideoShoppingPlayer Extensions

private extension View {
    
    func playerFrame(isPipEnabled pip: Bool) -> some View {
        self.frame(
            width: pip ? 150 : nil,
            height: pip ? 250 : nil,
            alignment: .bottomTrailing)
    }
}


struct PlayerScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlayerScreen()
    }
}
