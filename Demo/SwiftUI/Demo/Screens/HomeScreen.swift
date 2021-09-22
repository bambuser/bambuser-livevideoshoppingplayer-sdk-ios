//
//  HomeScreen.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI
import BambuserLiveVideoShoppingPlayer

/**
 This is the first main screen in the demo. It presents many
 menu alternatives and registers a PiP restore listener that
 is responsible for restoring PiP players that exit PiP when
 the source player screen has been deallocated.
 */
struct HomeScreen: View {
    
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
        .pictureInPictureRestore { _ in
            print("Restoring parentless PiP player...")
            sheet.present(playerModal)  // For now, just restore in a sheet
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
