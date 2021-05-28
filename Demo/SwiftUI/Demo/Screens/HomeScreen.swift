//
//  HomeScreen.swift
//  LiveShoppingPlayer
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
                PlayerSettingsListSection()
            }
            .navigationTitle("Live Shopping Player")
            .buttonStyle(PlainButtonStyle())
            .listStyle(InsetGroupedListStyle())
        }
        .fullScreenCover(
            isPresented: $isCoverActive,
            content: playerScreen)
        .sheet(
            isPresented: $isSheetActive,
            content: playerScreen)
    }
}


// MARK: - Views

private extension HomeScreen {
    
    var playerSection: some View {
        Section(header: Text("Player")) {
            NavigationLink(destination: playerScreen()) {
                ListButton(icon: .player, text: "Show player")
            }
            Button(action: showAsSheet) {
                ListButton(icon: .sheet, text: "Show player as sheet")
            }
            Button(action: showAsCover) {
                ListButton(icon: .cover, text: "Show player as full screen cover")
            }
        }
    }
    
    func playerScreen() -> some View {
        PlayerScreen()
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
