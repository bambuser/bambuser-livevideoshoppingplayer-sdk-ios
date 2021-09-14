//
//  ListButton.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI

/**
 This view is used as a menu list item in the demo app.
 */
struct ListItem: View {
    
    let icon: Image
    let text: String
    
    var body: some View {
        HStack {
            ListIcon(icon: icon)
            Text(text)
        }
    }
}

struct ListItem_Previews: PreviewProvider {
    
    static var previews: some View {
        ListItem(icon: .cover, text: "Open as cover")
    }
}
