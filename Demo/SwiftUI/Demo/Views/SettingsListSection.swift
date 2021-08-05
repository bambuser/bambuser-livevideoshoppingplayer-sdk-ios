//
//  SettingsListSection.swift
//  BambuserLiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI

/**
 This view can be injected into a list to provide a settings
 section for the demo experience.
 */
struct SettingsListSection: View {
    
    @EnvironmentObject private var demoContext: DemoContext
    
    var body: some View {
        Group {
            Section(header: Text("Configuration")) {
                text(.link, "Base URL", $demoContext.baseUrl)
                text(.theme, "Custom Theme Name", $demoContext.themeName)
            }
            Section(header: Text("Shows")) {
                toggle(.calendar, "Load upcoming show", demoContext.loadUpcomingShow)
            }
            Section(header: Text("UI Overlays")) {
                toggle(.cart, "Cart View", $demoContext.cartView)
                toggle(.cart, "Cart Button", $demoContext.cartButton)
                toggle(.chat, "Chat Overlay", $demoContext.chatOverlay)
                toggle(.product, "Product List", $demoContext.productList)
                toggle(.product, "Product View", $demoContext.productView)
                toggle(.share, "Share Button", $demoContext.shareButton)
                toggle(.subscribe, "Subscribe Button", $demoContext.subscribeButton)
            }
        }
    }
}

private extension SettingsListSection {
    
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
        SettingsListSection()
    }
}
