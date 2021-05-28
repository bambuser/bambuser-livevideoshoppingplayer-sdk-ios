//
//  ListIcon.swift
//  Demo
//
//  Created by Daniel Saidi on 2021-05-19.
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI

struct ListIcon: View {
    
    let icon: Image
    
    var body: some View {
        icon
            .environment(\.sizeCategory, .medium)
            .frame(width: 25)
    }
}

struct ListIcon_Previews: PreviewProvider {
    static var previews: some View {
        ListIcon(icon: .close)
    }
}
