//
//  HomeScreen.swift
//  BambuserLiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var isCoverActive = false
    @State private var isSheetActive = false
            
    var body: some View {
        NavigationView {
            List {
                playerSection
                SettingsListSection()
            }
            .navigationTitle("Live Shopping Player")
            .listStyle(InsetGroupedListStyle())
        }
        .navigationViewStyle(
            StackNavigationViewStyle())
        .fullScreenCover(
            isPresented: $isCoverActive,
            content: playerScreenForModal)
        .sheet(
            isPresented: $isSheetActive,
            content: playerScreenForModal)
    }
}


// MARK: - Views

private extension HomeScreen {
    
    var playerSection: some View {
        Section(header: Text("Player")) {
            NavigationLink(destination: playerScreen()) {
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
    
    func playerScreen() -> some View {
        PlayerScreen(showCloseButton: false)
    }
    
    func playerScreenForModal() -> some View {
        PlayerScreen(showCloseButton: true)
    }
}


// MARK: - Functions

private extension HomeScreen {
    
    func showAsCover() {
        isCoverActive = true
    }
    
    func showAsSheet() {
        isSheetActive = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
