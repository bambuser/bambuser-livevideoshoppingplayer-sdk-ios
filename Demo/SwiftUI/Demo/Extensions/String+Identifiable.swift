//
//  String+Identifiable.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import Foundation

extension String: Identifiable {

    /**
     Conforming to Identifiable makes it possible for string
     values to be used as triggers for alerts, sheets etc.
     */
    public var id: String { self }
}
