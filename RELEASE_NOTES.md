# Release Notes

This library will follow semver after the first major release.

Until then, the library is an experimental beta that may have breaking changes between minor versions.


## 0.2

### ✨ New features

* `CalendarEvent` is a new type that can be extracted from a `PlayerEventInfo` that contains valid calendar data.
* `CalendarEvent` has a function for saving the event into any calendar in any store.
* `LiveVideoShoppingPlayerContext` has a `.shared` context that you can use for convenience.
* `LiveVideoShoppingPlayerInterface` has more information and functions.
* `PlayerEvent` has a new `shareShow` event.
* `PlayerEventInfo` is a new struct that simplifies working with player events.

### 💡 Behavior changes

* `LiveVideoShoppingPlayer` now uses the `.shared` context by default.
* `LiveVideoShoppingPlayer` now automatically tears down its interface when needed.
* `LiveVideoShoppingPlayerInterface` `showId` is no longer optional.

### 💥 Breaking changes

* `LiveVideoShoppingPlayerView` must be created with a `showId`.
* `LiveVideoShoppingPlayerContext` `interface` is now internally settable only.
* `PlayerConfiguration.autoplay` is renamed to `shareAutoplay` and moved in init.
* `PlayerConfiguration.eventHandler` now provides the player as well.
* `PlayerConfiguration.soundControl` has been removed.
* `PlayerConfiguration.UI.addToCalendarSheet` has been removed.
* `PlayerEventInfo` is now used in event handler, instead of raw dictionaries.
* Internal player sheets are no longer supported.  Use player events instead.

### 🐛 Bug fixes

* We have fixed the bug where tapping a loading player removed it.



## 0.1.1

### ✨ New features

* The embedded player will now ignore safe areas when needed  
* `PlayerConfiguration.UI` has a new `addToCalendarSheet` option
* `PlayerEvent` has a new `addShowToCalendar` event

### 💡 Behavior changes

* The top-right close button in the player is now hidden by default.



## 0.1.0

This is the first beta release. It makes it possible to create players in different ways:

* `LiveVideoShoppingPlayer` for SwiftUI
* `LiveVideoShoppingPlayerView` for UIKit
* `LiveVideoShoppingPlayerViewController` for UIKit

You can also configure the player, listen for events, trigger functionality within the player etc.

Documentation and the readme is still work in progress and will be improved in later versions.
