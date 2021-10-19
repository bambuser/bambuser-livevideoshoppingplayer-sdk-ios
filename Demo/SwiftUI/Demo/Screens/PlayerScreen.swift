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
 
 If a `restoredPlayer` is provided, the screen will use that
 player instead of creating a new one.
 */
struct PlayerScreen: View {
    
    init(
        showCloseButton: Bool,
        restoredPlayer: LiveVideoShoppingPlayer? = nil) {
        self.showCloseButton = showCloseButton
        self.restoredPlayer = restoredPlayer
    }
    
    let showCloseButton: Bool
    let restoredPlayer: LiveVideoShoppingPlayer?
    
    @StateObject private var alert = AlertContext()
    @StateObject private var sheet = SheetContext()
    
    @StateObject private var playerContext = LiveVideoShoppingPlayerContext.shared
    
    @EnvironmentObject private var settings: DemoSettings
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            player
            menu
        }
        .padding(5)
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
        playerView
            .background(BambuserLogoBackground())
            .cornerRadius(7)
            .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 2)
    }
    
    var playerView: some View {
        if let player = restoredPlayer { return player }
            
        return LiveVideoShoppingPlayer(
            showId: settings.showId,
            configuration: settings.playerConfiguration { info in
                switch info.event {
                case .addShowToCalendar: saveCalendarEvent(in: info)
                case .playerDidClose: dismiss()
                case .shareShow: shareUrl(in: info)
                default: print("Unhandled Event: \(info.event), data: \(info.data)")
                }
            },
            context: playerContext)
    }
}


// MARK: - Internal Functionality

extension PlayerScreen {
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func saveCalendarEvent(in info: PlayerEventInfo) {
        guard let event = info.calendarEvent else { return print("No calendar event in event info.") }
        event.saveToCalendar { result in
            switch result {
            case .failure: alert(title: "Error", message: "Failed to save calendar event.")
            case .success: alert(title: "Success", message: "Event was added to calendar at \(event.startDate).")
            }
        }
    }
    
    func shareUrl(in info: PlayerEventInfo) {
        guard let url = info.url(for: .url) else { return print("No url in event info.") }
        sheet.present(ShareSheet(activityItems: [url]))
    }
}


// MARK: - Private Functionality

private extension PlayerScreen {
    
    func alert(title: String, message: String) {
        alert.present(Alert(
            title: Text(title),
            message: Text(message)
        ))
    }
}


struct PlayerScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        PlayerScreen(showCloseButton: false)
    }
}
