//
//  ListIcon.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI

/**
 This view is used to apply a certain icon style to all menu
 list items in the demo app.
 */
struct ListIcon: View {
    
    let icon: Image
    
    var body: some View {
        icon.environment(\.sizeCategory, .medium)
            .frame(width: 25)
    }
}

struct ListIcon_Previews: PreviewProvider {
    
    static var previews: some View {
        ListIcon(icon: .close)
    }
}
