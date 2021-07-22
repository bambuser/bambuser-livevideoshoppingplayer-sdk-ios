//
//  Playerable.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import BambuserLiveVideoShoppingPlayer

protocol Playerable {
    
    var playerView: LiveVideoShoppingPlayerView! { get set }
    
    func showFullScreen(playerView: LiveVideoShoppingPlayerView)
}
