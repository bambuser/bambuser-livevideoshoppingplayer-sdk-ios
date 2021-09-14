//
//  HomeCellViewModel.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import UIKit

final class HomeCellViewModel<T> {
    
    internal init(title: String, image: UIImage?, value: T?, onValueChanged: ((T) -> Void)?) {
        self.title = title
        self.image = image
        self.value = value
        self.onValueChanged = onValueChanged
    }
    
    let title: String
    let image: UIImage?
    let value: T?
    let onValueChanged: ((T) -> Void)?
}
