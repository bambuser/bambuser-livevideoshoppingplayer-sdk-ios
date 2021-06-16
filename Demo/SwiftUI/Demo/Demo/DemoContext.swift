//
//  DemoContext.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI
import BambuserLiveVideoShoppingPlayer

/**
 This is a demo-specific class that can be used to configure
 the demo app and handle its state.
 */
class DemoContext: ObservableObject {
    
    init() {
        showId = Self.firstShowId
    }
    
    @Published var showId: String

    
    // Demo settings
    
    @AppStorage("themeName") var themeName = ""
    @AppStorage("nativeAddToCalendarSheet") var nativeAddToCalendarSheet = false
    
    public var loadUpcomingShow: Binding<Bool> {
        .init(get: { self.showId == Self.upcomingShowId },
              set: { self.showId = $0 ? Self.upcomingShowId : Self.firstShowId }
        )
    }
    
    
    // UI overlays
    
    @AppStorage("addToCalendarSheet") var addToCalendarSheet = true
    @AppStorage("cartView") var cartView = true
    @AppStorage("cartButton") var cartButton = true
    @AppStorage("chatOverlay") var chatOverlay = true
    @AppStorage("productList") var productList = true
    @AppStorage("productView") var productView = true
    @AppStorage("shareButton") var shareButton = true
    @AppStorage("shareMenuButton") var shareMenuButton = true
    @AppStorage("subscribeButton") var subscribeButton = true
    
    private static let firstShowId = "vAtJH3xevpYTLnf1oHao"
    private static let secondShowId = "xB4a9LpDq5mU0CdCZa3k"
    private static let upcomingShowId = "64HtFC21MpBGEx6RSynn"
    
    var theme: PlayerTheme {
        let name = themeName.trimmingCharacters(in: .whitespaces)
        if name.isEmpty { return .standard }
        return .name(name)
    }
    
    func loadNextShow() -> String {
        let first = Self.firstShowId
        let second = Self.secondShowId
        let isFirstShow = showId == first
        showId = isFirstShow ? second : first
        return showId
    }
    
    func playerConfiguration(for eventHandler: @escaping PlayerConfiguration.EventHandler = { _, _ in }) -> PlayerConfiguration {
        PlayerConfiguration(
            theme: theme,
            buttons: PlayerConfiguration.Buttons(),
            ui: PlayerConfiguration.UI(
                addToCalendarSheet: .state(for: addToCalendarSheet),
                cartView: .state(for: cartView),
                cartButton: .state(for: cartButton),
                chatOverlay: .state(for: chatOverlay),
                productList: .state(for: productList),
                productView: .state(for: productView),
                shareButton: .state(for: shareButton),
                subscribeButton: .state(for: subscribeButton)
            ),
            eventHandler: eventHandler
        )
    }
}

private extension PlayerConfiguration.UIState {
    
    static func state(for bool: Bool) -> Self {
        bool ? .visible : .hidden
    }
}
