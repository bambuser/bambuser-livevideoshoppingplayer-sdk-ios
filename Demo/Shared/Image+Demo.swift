//
//  Image+Demo.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI

extension Image {
    
    static let logo = Image("Logo")
    
    static let calendar = image("calendar")
    static let cart = image("cart")
    static let chat = image("bubble.right")
    static let close = image("xmark.circle")
    static let cover = image("rectangle.inset.fill")
    static let link = image("link")
    static let next = image("shuffle.circle")
    static let pip = image("pip")
    static let pipEnter = image("pip.enter")
    static let pipExit = image("pip.exit")
    static let player = image("iphone.badge.play")
    static let product = image("tag")
    static let share = image("square.and.arrow.up")
    static let sheet = image("rectangle.bottomthird.inset.fill")
    static let subscribe = image("bell")
    static let theme = image("paintpalette")
}

private extension Image {

    static func image(_ name: String) -> Image {
        Image(systemName: name)
    }
}
