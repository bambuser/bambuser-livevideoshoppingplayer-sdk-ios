//
//  Player.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import BambuserLiveVideoShoppingPlayer
import SwiftUI

/**
 This is a demo-specific player that can be added to various
 screens in the demo.
 */
struct Player: View {
    
    let playerContext: LiveVideoShoppingPlayerContext
    
    /**
     This is needed, since @State properties can't be nil.
     */
    class Context: ObservableObject {

        @Published var alertMessage: String?
        @Published var alertTitle: String?
        @Published var shareUrl: URL?
    }

    @StateObject private var context = Context()
    @EnvironmentObject private var settings: DemoSettings
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        player
            .alert(item: $context.alertMessage) { _ in alert }
            .sheet(item: $context.shareUrl) { _ in sheet }
    }
}


// MARK: - Private views

private extension Player {
    
    var alert: Alert {
        Alert(
            title: Text(context.alertTitle ?? ""),
            message: Text(context.alertMessage ?? ""))
    }
    
    var player: some View {
        LiveVideoShoppingPlayer(
            showId: showId,
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
    
    var sheet: some View {
        guard let url = context.shareUrl else { return ShareSheet(activityItems: []) }
        return ShareSheet(activityItems: [url])
    }
}


// MARK: - Private Functionality

private extension Player {
    
    var showId: String {
        settings.showId
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func saveCalendarEvent(in info: PlayerEventInfo) {
        guard let event = info.calendarEvent else { return }
        event.saveToCalendar { result in
            switch result {
            case .failure: alert(title: "Error", message: "Failed to save calendar event.")
            case .success: alert(title: "Success", message: "Event was added to calendar at \(event.startDate).")
            }
        }
    }
    
    func shareUrl(in info: PlayerEventInfo) {
        context.shareUrl = info.url(for: .url)
    }
    
    func alert(title: String, message: String) {
        context.alertTitle = title
        context.alertMessage = message
    }
}


// MARK: - Previews

struct Player_Previews: PreviewProvider {
    
    static var previews: some View {
        Player(playerContext: .shared)
    }
}
