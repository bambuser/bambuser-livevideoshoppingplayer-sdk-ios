//
//  DemoContext.swift
//  LiveShoppingPlayer
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
    
    @AppStorage("themeName") var themeName: String = ""
    
    @AppStorage("cartView") var cartView: Bool = true
    @AppStorage("cartButton") var cartButton: Bool = true
    @AppStorage("chatOverlay") var chatOverlay: Bool = true
    @AppStorage("productList") var productList: Bool = true
    @AppStorage("productView") var productView: Bool = true
    @AppStorage("shareButton") var shareButton: Bool = true
    @AppStorage("shareMenuButton") var shareMenuButton: Bool = true
    @AppStorage("subscribeButton") var subscribeButton: Bool = true
    
    private static let firstShowId: String = "vAtJH3xevpYTLnf1oHao"
    private static let secondShowId: String = "xB4a9LpDq5mU0CdCZa3k"
    
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
            buttons: PlayerConfiguration.Buttons(
                dismiss: .minimize),
            ui: PlayerConfiguration.UI(
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
