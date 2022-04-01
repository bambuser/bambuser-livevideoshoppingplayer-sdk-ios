//
//  HomeScreen.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI
import BambuserLiveVideoShoppingPlayer

/**
 This is the demo home screen. It presents many options that
 can be used to configure the demo player and also registers
 a PiP restore action that smoothly restores any LVS players
 that exit PiP when their source screen has been deallocated.
 */
struct HomeScreen: View {

    @EnvironmentObject private var settings: DemoSettings

    @StateObject private var cover = FullScreenCoverContext()
    @StateObject private var sheet = SheetContext()
            
    var body: some View {
        NavigationView {
            List {
                playerSection
                SettingsListSection()
            }
            .navigationTitle("Demo")
            .listStyle(InsetGroupedListStyle())
        }
        .navigationViewStyle(
            StackNavigationViewStyle())
        .fullScreenCover(context: cover)
        .sheet(context: sheet)
        .pictureInPictureRestore { (player, completion) in
            print("Restoring parentless PiP player...")
            restorePlayer(player, completion: completion)
        }
        .pictureInPictureClose {
            print("Closing parentless PiP player...")
        }
    }
}


// MARK: - Views

private extension HomeScreen {
    
    var playerSection: some View {
        Section(header: Text("Player")) {
            NavigationLink(destination: playerScreen) {
                ListItem(icon: .player, text: "Show player")
            }
            Button(action: showAsSheet) {
                ListItem(icon: .sheet, text: "Show player as sheet")
            }
            Button(action: showAsCover) {
                ListItem(icon: .cover, text: "Show player as full screen cover")
            }
        }
    }
    
    var playerModal: some View {
        PlayerScreen(showCloseButton: true)
    }
    
    var playerScreen: some View {
        PlayerScreen(showCloseButton: false)
    }
}


// MARK: - Functions

private extension HomeScreen {
    
    func restorePlayer(_ player: LiveVideoShoppingPlayer, completion: @escaping () -> Void) {
        sheet.present(
            PlayerScreen(showCloseButton: true, restoredPlayer: player)
                .onAppear(perform: completion)
        )
    }
    
    func showAsCover() {
        cover.present(playerModal)
    }
    
    func showAsSheet() {
        sheet.present(playerModal)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeScreen()
    }
}
