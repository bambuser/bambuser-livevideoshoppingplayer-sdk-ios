//
//  ListButton.swift
//  LiveShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI

struct ListButton: View {
    
    let icon: Image
    let text: String
    
    var body: some View {
        HStack {
            ListIcon(icon: icon)
            Text(text)
        }
    }
}

struct ListButton_Previews: PreviewProvider {
    static var previews: some View {
        ListButton(icon: .cover, text: "Open as cover")
    }
}
