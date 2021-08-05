//
//  BambuserLogoBackground.swift
//  BambuserLiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI

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
                Spacer()
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct BambuserLogo_Previews: PreviewProvider {
    static var previews: some View {
        BambuserLogoBackground()
    }
}
