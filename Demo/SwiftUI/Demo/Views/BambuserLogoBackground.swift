//
//  BambuserLogoBackground.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI

/**
 This view is used as a backdrop behind the demo player.
 */
struct BambuserLogoBackground: View {
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Image.logo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .colorInvert()
                Spacer()
            }
            Spacer()
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct BambuserLogo_Previews: PreviewProvider {
    static var previews: some View {
        BambuserLogoBackground()
    }
}
