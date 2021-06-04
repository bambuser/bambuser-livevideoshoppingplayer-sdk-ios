//
//  PlayerSettingsListSection.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI

/**
 This view can be injected into a list to provide a settings
 section for the demo experience.
 */
struct PlayerSettingsListSection: View {
    
    @EnvironmentObject private var demoContext: DemoContext
    
    var body: some View {
        Section(header: Text("Player Settings")) {
            text(.theme, "Custom Theme Name", $demoContext.themeName)
            toggle(.cart, "Show Cart View", $demoContext.cartView)
            toggle(.cart, "Show Cart Button", $demoContext.cartButton)
            toggle(.chat, "Show Chat Overlay", $demoContext.chatOverlay)
            toggle(.product, "Show Product List", $demoContext.productList)
            toggle(.product, "Show Product View", $demoContext.productView)
            toggle(.share, "Show Share Button", $demoContext.shareButton)
            toggle(.share, "Show Share MenuButton", $demoContext.shareMenuButton)
            toggle(.subscribe, "Show Subscribe Button", $demoContext.subscribeButton)
        }
    }
}

private extension PlayerSettingsListSection {
    
    func text(_ icon: Image, _ title: String, _ text: Binding<String>) -> some View {
        HStack {
            ListIcon(icon: icon)
            TextField(title, text: text)
        }
    }
    
    func toggle(_ icon: Image, _ title: String, _ state: Binding<Bool>) -> some View {
        HStack {
            ListIcon(icon: icon)
            Toggle(title, isOn: state)
        }
    }
}

struct ListSettingsSection_Previews: PreviewProvider {
    static var previews: some View {
        PlayerSettingsListSection()
    }
}
