# Release Notes

This SDK is currently an experimental beta.

It will follow semver only after the first major release. Until then, it may (and most probably will) have breaking changes between minor versions.

## 0.9.1

### ✨ New features

* Support swift 5.8

### 💥 Breaking changes

* Drop support for iOS12

### 🐛 Known issues

* Replay button on the end curtain does not work.
* Landscape video is currently not supported.


## 0.9.0

### ✨ New features

* `updateShowStatus` event at `ShowStatus.ended` contains an array of products highlighted during the show.

### 💥 Breaking changes

* Event `openExternalUrl`- Is no longer emitted when tapping a product thumbnail.
* Removed `PlayerViewerInfo` option from `PlayerConfiguration`.
* Removed `subscribeButton` option from `PlayerUIConfiguration`.

### 🐛 Known issues

* Replay button on the end curtain does not work.
* Landscape video is currently not supported.

## 0.8.1

### ✨ New features

* New event `openExternalUrl`- Emitted when user taps a link.

### 🐛 Known issues

* Replay button on the end curtain does not work.
* Landscape video is currently not supported.


## 0.8

This version adds support for iOS 12.

### ✨ New features

* New `PlayerUIConfiguration` options `actionBar` and `emojiOverlay` for setting visibility of the action bar and and the emoji overlay.
* New event `PlayerEvent.showEmojiBatch` emitted when a batch of emojis is to be animated.
* New event `PlayerEvent.pictureInPictureRestoreToFullscreen` emitted when picture-in-picture restores back to fullscreen.
* New event `PlayerEvent.pictureInPictureDidStop` when picture-in-picture is stopped.
* `PictureInPictureClosedComponent` can be implemented by any class that wants to listen to picture-in-picture window closed events.
* `PictureInPictureRestoreModifier` is a SwiftUI view modifier that can be used to handle picture-in-picture window closed events.
* `View` has a new `pictureInPictureClose` modifier that can be used to listen to picture-in-picture window closed events.
* `UIView` and `UIViewController` has a new `registerPictureInPictureCloseAction` function that can be used to register a picture-in-picture window closed event listener.
* `PictureInPictureState` has a new `restorePlayer` function to restore back to fullscreen programatically.
* `PictureInPictureState` has a new `isPictureInPictureActive` property.
* `LiveVideoShoppingPlayerView` has a new `volume` property.
* `PlayerFunction.hideUI` takes a `PlayerUISections` as value for hiding selected parts of the UI.

### 💡 Behavior changes

* Correct usage of safe insets.

### 💥 Breaking changes

* `PlayerFunction.hideUI` has been changed to a enum with a associated value.

### 🐛 Known issues

* Replay button on the end curtain does not work.
* Landscape video is currently not supported.

## 0.7

This version adds support for Swift 5.5 and DocC.

This new version also makes it possible to use the player in fullscreen edge-to-edge mode.

### ✨ New features

* The player can now be used in fullscreen.
* The DocC documentation has more information.
* More types implement `Codable` and `Equatable`.



## 0.6.2

This version adds missing required attributes to the CocoaPods specification file.



## 0.6.1

This version works with Xcode 12.5.0 and newer.



## 0.6

This version improves PiP restoration and cleans up even more things in the library.

Improved PiP restoration means that exiting PiP when the original screen has been disposed is now a much nicer experience, where the video will smoooothly pop back into place.

### ✨ New features

* More types implement `Equatable`.    
* `PlayerConfiguration` has a new, static `standard` function that takes an event handler.
* `PictureInPictureState` has a new `resetRestoreAction` function.

### 💡 Behavior changes

* The PiP restoration attempt takes place earlier, which makes it possible to get a more seamless experience.
* The UIKit demo uses this new behavior to restore the player in a much nicer way.
* The SwiftUI demo currently doesn't make use of this new behavior.

### 💥 Breaking changes

* All deprecated functionality has been removed.
* `AddToCalendarError.missingEventData` can no longer occur and has been removed.
* `LiveVideoShoppingPlayerContext` `interface` is renamed to `player`.
* `LiveVideoShoppingPlayerInterface` has been replaced with just using `LiveVideoShoppingPlayerView`.



## 0.5

This version improves picture-in-picture (PiP) support.

PiP players will now stay alive even if the user leaves the player screen. This makes in-app navigation possible while PiP is active.

It is now also possible to restore a PiP player that has left its source screen.

This release also renames and makes many nested player configuration types non-nested.  

### ✨ New features
  
* `LiveVideoShoppingPlayer` has made `showId` and `configuration` public, to simplify PiP restoration.
* `LiveVideoShoppingPlayerInterface` `invoke` replaces `PlayerUIPresenter` and the `showUI` and `hideUI` functions.
* `PictureInPictureConfiguration` is a new configuration used by the `PlayerConfiguration`, to configure how PiP behaves.
* `PictureInPictureRestoreComponent` can be implemented by any class that wants to listen to PiP restore events.
* `PictureInPictureRestoreModifier` is a new SwiftUI view modifier that can be used to handle PiP restore events.
* `pictureInPictureRestore` is a new SwiftUI view extension that applies a `PictureInPictureRestoreModifier` to the view.
* `PlayerConfiguration` has a new `pipConfig` parameter and property.
* `PlayerEvent.showProductView` is now emitted even if you haven't responded to the `.provideProductData` event.
* `PlayerFunction` is a new enum that describes player-specific functionality.
* `View` has a new `pictureInPictureRestore` modifier that can be used to listen to PiP restore events.
* `UIView` and `UIViewController` has a new `registerPictureInPictureRestoreAction` function that can be used to register a PiP restore event listener.

### 💡 Behavior changes

* An active picture-in-picture player will no longer die when you leave the screen that started it.

### 🗑 Deprecated

* `LiveVideoShoppingPlayerInterface` `showUI` and `hideUI` are deprecated and will be removed in `0.6`.
* `PlayerButtonConfiguration` is deprecated and will be removed in `0.6`.
* `PlayerButtonConfiguration.LinkConfig` is deprecated and will be removed in `0.6`.
* `PlayerConfiguration` `isViewerSubscribed` has been moved to a `PlayerViewerInfo` struct.
* `PlayerConfiguration.ButtonConfiguration` has been renamed to `PlayerButtonConfiguration`.
* `PlayerConfiguration.EnabledState` has been renamed to `PlayerEnabledState`.
* `PlayerConfiguration.LocaleInfo` has been renamed to `PlayerLocaleInfo`.
* `PlayerConfiguration.ShareConfiguration` has been renamed to `PlayerShareConfiguration`.
* `PlayerConfiguration.StreamerInfo` has been renamed to `PlayerStreamerInfo`.
* `PlayerConfiguration.UIConfiguration` has been renamed to `PlayerUIConfiguration`.
* `PlayerConfiguration.UIState` has been renamed to `PlayerOverlayVisiblity`.
* `PlayerUIPresenter` is deprecated and will be removed in `0.6`. 

### 💥 Breaking changes

* The demos now require Xcode 13.
* `ButtonConfiguration` `dismissConfig` was not used and has been removed.
* `LiveVideoShoppingPlayerViewController` is no longer public.
* `PlayerButtonConfiguration.DismissConfig` was not used and has been removed.
* `PlayerConfiguration` no longer has a `buttons` configuration option.



## 0.4

This version adds native picture-in-picture support.

### ✨ New features

* More structs and enums now implement `Codable` and `CaseIterable`.
* `LiveVideoShoppingPlayerInterface` now implements `PictureInPictureController`. 
* `PictureInPictureController` is a new protocol that describes how to handle PiP.
* `PlayerConfiguration.ButtonConfiguration` has a new `.standard` builder.
* `PlayerConfiguration.LocaleInfo` has a new `.standard` builder.
* `PlayerConfiguration.Streamer` has a new `.standard` builder.
* `PlayerConfiguration.UIConfiguration` has a new `.standard` builder.
* `PlayerUIPresenter` is a new protocol that describes how to show and hide the player UI overlay.
* `ShowPresenter` is a new protocol that describes how to present shows in a video player.

### 💥 Breaking changes

* `PlayerConfiguration` has renamed `theme` to `engine`, `buttons` to `buttonConfig` and `ui` to `uiConfig`.
* `PlayerConfiguration` now requires you to provide an explicit event handler.
* `PlayerConfiguration.Buttons` has been renamed to `ButtonConfiguration`.
* `PlayerConfiguration.Streamer` has been renamed to `StreamerInfo`.
* `PlayerConfiguration.UI` has been renamed to `UIConfiguration`.
* `PlayerTheme` has been renamed to `PlayerEngine`.
* `PlayerTheme.name` has been renamed to `PlayerEngine.client`.
* `ShowStatus` is a new enum that can be used to identify the current state of a show.



## 0.3

### ✨ New features

* `LiveVideoShoppingPlayerInterface` has new `hideUI` and `showUI` functions.
* `PlayerEvent` has new `hide/showCart` events.
* `PlayerEvent` has new `hide/showChatOverlay` events.
* `PlayerEvent` has new `hide/showProductList` events.
* `PlayerEvent` has new `playerDidSwipe` events.
* `PlayerEvent` has new `subscribe/unsubscribe` events.
* `PlayerEvent` has a new `updateShowStatus` event.

### 💥 Breaking changes

* `LiveVideoShoppingPlayerInterface` `callFunction` has been removed. Use the new functions instead.
* `PlayerEvent.playerClosed` has been renamed to `playerDidClose`
* `PlayerEvent.playerLoaded` has been renamed to `playerDidLoad`



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
