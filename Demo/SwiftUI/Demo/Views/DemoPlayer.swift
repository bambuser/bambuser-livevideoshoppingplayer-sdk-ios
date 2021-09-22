//
//  DemoPlayer.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import BambuserLiveVideoShoppingPlayer
import SwiftUI

/**
 This is a demo-specific player that can be added to various
 screens in the demo.
 
 The player listens for player events, using a shared player
 configuration that is provided by `DemoPlayerSettings`. The
 screen implements `DemoPlayerEventHandler` to handle events,
 like saving calendar events, sharing events etc.
 */
struct DemoPlayer: View, DemoPlayerEventHandler {
    
    let playerContext: LiveVideoShoppingPlayerContext
    
    @StateObject private var alert = AlertContext()
    @StateObject private var sheet = SheetContext()
    
    @EnvironmentObject private var settings: DemoSettings
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        player
            .alert(context: alert)
            .sheet(context: sheet)
    }
}


// MARK: - Private views

private extension DemoPlayer {
    
    var player: some View {
        LiveVideoShoppingPlayer(
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

extension DemoPlayer {
    
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

private extension DemoPlayer {
    
    func alert(title: String, message: String) {
        alert.present(Alert(
            title: Text(title),
            message: Text(message)
        ))
    }
}


// MARK: - Previews

struct Player_Previews: PreviewProvider {
    
    static var previews: some View {
        DemoPlayer(playerContext: .shared)
    }
}
