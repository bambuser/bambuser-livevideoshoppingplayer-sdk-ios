//
//  DemoPlayerEventHandler.swift
//  Demo
//
//  Created by Daniel Saidi on 2021-09-21.
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import BambuserLiveVideoShoppingPlayer

/**
 This demo-specific protocol is used to harmonize how a demo
 app handles player events.
 */
protocol DemoPlayerEventHandler {
    
    /**
     This will be called when the embedded player triggers a
     `.playerDidClose` event.
     */
    func dismiss()
    
    /**
     This will be called when the embedded player triggers a
     `.addShowToCalendar` event.
     */
    func saveCalendarEvent(in info: PlayerEventInfo)
    
    /**
     This will be called when the embedded player triggers a
     `.shareShow` event.
     */
    func shareUrl(in info: PlayerEventInfo)
}
