//
//  SettingsListSection.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import SwiftUI

/**
 This view can be injected into a list to provide a settings
 section for the demo experience.
 */
struct SettingsListSection: View {
    
    @EnvironmentObject private var settings: DemoSettings
    
    var body: some View {
        Group {
            Section(header: Text("Configuration")) {
                text(.link, "Share base URL", $settings.baseUrl)
                text(.theme, "Player Engine", $settings.themeName)
            }
            Section(header: Text("Shows")) {
                toggle(.calendar, "Load upcoming show", settings.loadUpcomingShow)
            }
            Section(header: Text("Picture-in-picture"), footer: Text("Picture-in-picture only works on real devices.")) {
                toggle(.pip, "Enabled", $settings.isPiPEnabled)
                toggle(.pipEnter, "Automatic", $settings.isPiPAutomatic)
                toggle(.pipRestore, "Restore", $settings.shouldRestorePiPAutomatically)
            }
            Section(header: Text("UI Overlays")) {
                toggle(.rectangle, "Action Bar", $settings.actionBar)
                toggle(.cart, "Cart View", $settings.cartView)
                toggle(.cart, "Cart Button", $settings.cartButton)
                toggle(.chat, "Chat Overlay", $settings.chatOverlay)
                toggle(.heart, "Emoji Overlay", $settings.emojiOverlay)
                toggle(.product, "Product List", $settings.productList)
                toggle(.product, "Product View", $settings.productView)
                toggle(.share, "Share Button", $settings.shareButton)
                toggle(.subscribe, "Subscribe Button", $settings.subscribeButton)
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
