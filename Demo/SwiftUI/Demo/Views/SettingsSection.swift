//
//  SettingsSection.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI

/**
 This view can be injected into a list to provide a settings
 section for the demo experience.
 */
struct SettingsSection: View {
    
    @EnvironmentObject private var demoContext: DemoContext
    
    var body: some View {
        Group {
            Section(header: Text("Demo Settings")) {
                text(.theme, "Custom Theme Name", $demoContext.themeName)
                toggle(.calendar, "Load upcoming show", demoContext.loadUpcomingShow)
                toggle(.calendar, "Native Calendar Sheet", $demoContext.nativeAddToCalendarSheet)
            }
            Section(header: Text("UI Overlays")) {
                toggle(.calendar, "Add To Calendar Sheet", $demoContext.addToCalendarSheet)
                toggle(.cart, "Cart View", $demoContext.cartView)
                toggle(.cart, "Cart Button", $demoContext.cartButton)
                toggle(.chat, "Chat Overlay", $demoContext.chatOverlay)
                toggle(.product, "Product List", $demoContext.productList)
                toggle(.product, "Product View", $demoContext.productView)
                toggle(.share, "Share Button", $demoContext.shareButton)
                toggle(.share, "Share MenuButton", $demoContext.shareMenuButton)
                toggle(.subscribe, "Subscribe Button", $demoContext.subscribeButton)
            }
        }
    }
}

private extension SettingsSection {
    
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
        SettingsSection()
    }
}
