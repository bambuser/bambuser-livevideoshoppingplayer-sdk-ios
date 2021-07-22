//
//  DemoContext.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import BambuserLiveVideoShoppingPlayer

/**
 This is a demo-specific class that can be used to configure
 the demo app and handle its state.
 */
final class DemoContext: ObservableObject {
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        showId = Self.firstShowId
        self.userDefaults = userDefaults
    }
    
    
    private let userDefaults: UserDefaults
    
    private(set) var showId: String
    
    private static let firstShowId: String = "vAtJH3xevpYTLnf1oHao"
    private static let secondShowId: String = "xB4a9LpDq5mU0CdCZa3k"
    
    
    lazy var themeName: String = userDefaults.string(forKey: "themeName") ?? ""{
        didSet {
            userDefaults.setValue(themeName, forKey: "themeName")
        }
    }
    
    lazy var cartView: Bool = userDefaults.object(forKey: "cartView") as? Bool ?? true {
        didSet {
            userDefaults.setValue(cartView, forKey: "cartView")
        }
    }
    
    lazy var cartButton: Bool = userDefaults.object(forKey: "cartButton") as? Bool ?? true {
        didSet {
            userDefaults.setValue(cartButton, forKey: "cartButton")
        }
    }
    
    lazy var chatOverlay: Bool = userDefaults.object(forKey: "chatOverlay") as? Bool ?? true {
        didSet {
            userDefaults.setValue(chatOverlay, forKey: "chatOverlay")
        }
    }
    
    lazy var productList: Bool = userDefaults.object(forKey: "productList") as? Bool ?? true {
        didSet {
            userDefaults.setValue(productList, forKey: "productList")
        }
    }
    
    lazy var productView: Bool = userDefaults.object(forKey: "productView") as? Bool ?? true {
        didSet {
            userDefaults.setValue(productView, forKey: "productView")
        }
    }
    
    lazy var shareButton: Bool = userDefaults.object(forKey: "shareButton") as? Bool ?? true {
        didSet {
            userDefaults.setValue(shareButton, forKey: "shareButton")
        }
    }
    
    lazy var shareMenuButton: Bool = userDefaults.object(forKey: "shareMenuButton") as? Bool ?? true {
        didSet {
            userDefaults.setValue(shareMenuButton, forKey: "shareMenuButton")
        }
    }
    
    lazy var subscribeButton: Bool = userDefaults.object(forKey: "subscribeButton") as? Bool ?? true {
        didSet {
            userDefaults.setValue(subscribeButton, forKey: "subscribeButton")
        }
    }
    
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
