//
//  Image+Demo.swift
//  Demo
//
//  Created by Daniel Saidi on 2021-05-18.
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI

extension Image {
    
    static let logo = Image("Logo")
    
    static let calendar = symbol("calendar")
    static let cart = symbol("cart")
    static let chat = symbol("bubble.right")
    static let close = symbol("xmark.circle")
    static let cover = symbol("rectangle.inset.fill")
    static let link = symbol("link")
    static let next = symbol("shuffle.circle")
    static let pipEnter = symbol("pip.enter")
    static let pipExit = symbol("pip.exit")
    static let player = symbol("iphone.badge.play")
    static let product = symbol("tag")
    static let share = symbol("square.and.arrow.up")
    static let sheet = symbol("rectangle.bottomthird.inset.fill")
    static let subscribe = symbol("bell")
    static let theme = symbol("paintpalette")
    
    static func symbol(_ name: String) -> Image {
        Image(systemName: name)
    }
}
