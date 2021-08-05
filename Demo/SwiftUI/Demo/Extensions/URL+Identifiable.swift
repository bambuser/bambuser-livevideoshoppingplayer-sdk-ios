//
//  URL+Identifiable.swift
//  BambuserLiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import Foundation

extension URL: Identifiable {

    /**
     Conforming to Identifiable makes it possible for an URL
     to be used as a trigger for alerts, sheets etc.
     */
    public var id: String { absoluteString }
}
