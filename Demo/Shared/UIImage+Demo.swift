//
//  UIImage+Demo.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import UIKit

extension UIImage {
    
    static let calendar = image("calendar")
    static let cart = image("cart")
    static let chat = image("bubble.right")
    static let close = image("xmark.circle")
    static let cover = image("rectangle.inset.fill")
    static let heart = image("heart")
    static let link = image("link")
    static let next = image("shuffle.circle")
    static let pipEnter = image("pip.enter")
    static let pipExit = image("pip.exit")
    static let pipRestore = image("arrow.uturn.forward")
    static let player = image("iphone.badge.play")
    static let product = image("tag")
    static let rectangle = image("rectangle")
    static let share = image("square.and.arrow.up")
    static let sheet = image("rectangle.bottomthird.inset.fill")
    static let subscribe = image("bell")
    static let theme = image("paintpalette")
}

private extension UIImage {

    static func image(_ name: String) -> UIImage? {
        UIImage(systemName: name)
    }
}
