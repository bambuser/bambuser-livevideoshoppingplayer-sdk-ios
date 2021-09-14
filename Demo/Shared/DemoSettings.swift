//
//  DemoSettings.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import BambuserLiveVideoShoppingPlayer
import SwiftUI

/**
 This is a demo-specific class that can be used to configure
 the demo app and handle its state.
 */
class DemoSettings: ObservableObject {
    
    init() {
        showId = Self.firstShowId
    }
    
    
    // MARK: - Shows
    
    @Published var showId: String
    
    private static let firstShowId = "vAtJH3xevpYTLnf1oHao"
    private static let secondShowId = "xB4a9LpDq5mU0CdCZa3k"
    private static let upcomingShowId = "64HtFC21MpBGEx6RSynn"
    
    
    // MARK: - Settings
    
    @AppStorage("baseUrl") var baseUrl = "http://www.example.com/SHOWID"
    @AppStorage("themeName") var themeName = ""
    
    @AppStorage("cartView") var cartView = true
    @AppStorage("cartButton") var cartButton = true
    @AppStorage("chatOverlay") var chatOverlay = true
    @AppStorage("productList") var productList = true
    @AppStorage("productView") var productView = true
    @AppStorage("shareButton") var shareButton = true
    @AppStorage("subscribeButton") var subscribeButton = true

    
    // MARK: - Demo settings
    
    /**
     This property uses `themeName` to resove a player theme.
     */
    var engine: PlayerEngine {
        let name = themeName.trimmingCharacters(in: .whitespaces)
        if name.isEmpty { return .standard }
        return .client(name)
    }
    
    /**
     This binding is used to update the `showId` property as
     a bool binding, using a toggle control.
     */
    var loadUpcomingShow: Binding<Bool> {
        .init(get: { self.showId == Self.upcomingShowId },
              set: { self.showId = $0 ? Self.upcomingShowId : Self.firstShowId }
        )
    }
    
    
    // MARK: - Functions
    
    /**
     Load the "next" show, which in the demo toggles between
     the `firstShowId` and `secondShowId`
     */
    func loadNextShow() -> String {
        let first = Self.firstShowId
        let second = Self.secondShowId
        let isFirstShow = showId == first
        showId = isFirstShow ? second : first
        return showId
    }
    
    /**
     Create a player configuration, given the current config.
     */
    func playerConfiguration(for eventHandler: @escaping PlayerConfiguration.EventHandler) -> PlayerConfiguration {
        PlayerConfiguration(
            engine: engine,
            buttonConfig: .standard,
            shareBaseUrl: baseUrl,
            uiConfig: PlayerConfiguration.UIConfiguration(
                cartView: cartView.uiState,
                cartButton: cartButton.uiState,
                chatOverlay: chatOverlay.uiState,
                productList: productList.uiState,
                productView: productView.uiState,
                shareButton: shareButton.uiState,
                subscribeButton: subscribeButton.uiState
            ),
            eventHandler: eventHandler
        )
    }
}

private extension Bool {
    
    /**
     Get a `UIState` for the current bool value.
     */
    var uiState: PlayerConfiguration.UIState {
        self ? .visible : .hidden
    }
}
