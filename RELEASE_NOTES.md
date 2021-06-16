# Release Notes

`BambuserLiveVideoShoppingPlayer` will follow semver after the first major release.

Until then, the SDK is considered beta and may have breaking changes between minor versions.


## 0.1.1

### ✨ New features

* The embedded player will now ignore the safe areas when needed  
* `PlayerConfiguration.UI` has a new `addToCalendarSheet` option
* `PlayerEvent` has a new `addShowToCalendar` event

### 💡 Behavior changes

* The top-right close button in the player is now hidden by default.


## 0.1.0

This is the first beta release of `BambuserLiveVideoShoppingPlayer`.

This version makes it possible to create players in different ways:

* `LiveVideoShoppingPlayer` for SwiftUI
* `LiveVideoShoppingPlayerView` for UIKit
* `LiveVideoShoppingPlayerViewController` for UIKit

You can also configure the player, listen for events, trigger functionality within the player etc.

The repository contains a basic SwiftUI demo. A UIKit demo will be added later.

Documentation and the readme is still work in progress and will be improved in later versions.
