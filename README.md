<div>
  <br/><br />
  <p align="center">
    <a href="https://bambuser.com" target="_blank" align="center">
        <img src="https://brand.bambuser.net/current/logo/bambuser-black-512.png" width="280">
    </a>
  </p>
  <br/><br />
</div>


# Bambuser Live Video Shopping Player (Beta)


## About

`BambuserLiveVideoShoppingPlayer` lets you add a Bambuser Live Video Shopping (LVS) Player to your app.

The LVS player can be used to watch live and recorded shows, with UI overlays to let you interact with the show.

The LVS player can be configured to great extent. Once a player is loaded, you can listen for events that are emitted by the player and perform player-specific functions. 

`BambuserLiveVideoShoppingPlayer` supports iOS 13+ and can be used with `UIKit` and `SwiftUI`.



## Beta Version

This project is in an early stage of development. Feel free to experiment with it, but refrain from using it in production.  

See the [release notes][ReleaseNotes] for status and progress.



## Installation

### Swift Package Manager

```
https://github.com/bambuser/bambuser-livevideoshoppingplayer-sdk-ios
```

After installing the SDK, you must import `BambuserVideoLiveShoppingPlayer` in every file where you want to use it.



## Getting started

### UIKit

With `UIKit`, you can create a player like this:

```
let player = LiveVideoShoppingPlayerView(
    showId: "The ID of the show to watch",
    configuration: playerConfiguration)
```

You can then add the player anywhere in your app, resize it to fit your needs etc.

Read more about configuration the player further down and have a look at the `UIKit` demo for examples.


### SwiftUI

With `SwiftUI`, you can create a player like this:

```
let player = LiveVideoShoppingPlayer(
    showId: "The ID of the show to watch",
    configuration: playerConfiguration)
```

You can then add the player anywhere in your app, resize it to fit your needs etc.

You can provide a custom `context` if you want more players active at the same time. 

Read more about configuration the player further down and have a look at the `SwiftUI` demo for examples.



## Player Configuration

You can use a `PlayerConfiguration` to configure the player instance. 

The player configuration specifies the following configuration parameters, most optional:

* `engine` - The player engine to use, by default `.standard`.
* `audioConfig` - The audio configuration to use, by default `.standard`.
* `localeInfo` - The locale info to use, by default `.standard`.
* `pipConfig` - The picture-in-picture configuration to use, by default `.standard`.
* `shareConfig` - The share configuration info to use, by default `.standard`.
* `streamerInfo` - Information about the streamer, by default `.standard`.
* `uiConfig` - The UI configuration to use, by default `.standard`.
* `viewerInfo` - Information about the viewer, by default `.standard`.
* `eventHandler` - The event handler to use for listening to player events.


### PlayerLocaleInfo

This type specifies the following locale information:

* `locale` - The local currency, by default `nil`.
* `currency` - The locale identifier, by default `nil`. 
* `trimPriceTrailingZeros` - Whether or not to trim trailing zeros in the price, by default `false`.


### PictureInPictureConfiguration

This type specifies the following PiP configurations:

* `isEnabled` - Whether or not picture-in-picture is enabled, by default `true`.
* `isAutomatic` - Whether or not picture-in-picture should autostart, by default `true`.

`isAutomatic` is only supported from iOS 14.2 and later.


### PlayerShareConfiguration

This type specifies the following share configurations:

* `autoplay` - Whether or not to use autoplay when sharing, by default `.enabled`.
* `baseUrl` - The base URL, if any, to apply to share URLs, by default `nil`.


### PlayerStreamerInfo

This type specifies the following streamer information:

* `name` - The streamer's name, by default `nil` 
* `avatar` - The streamer's avatar, by default `nil`


### PlayerUIConfiguration

This type specifies the following UI configurations:

* `cartView` - The visibility of the cart view, by default `.visible`. 
* `cartButton` - The visibility of the cart button, by default `.visible`.
* `chatOverlay` - The visibility of the chat overlay, by default `.visible`.
* `productList` - The visibility of the product list, by default `.visible`.
* `productView` - The visibility of the product view, by default `.visible`.
* `shareButton` - The visibility of the share button, by default `.hidden`.
* `subscribeButton` - The visibility of the subscribe button, by default `.hidden`.


### PlayerViewerInfo

This type specifies the following streamer information:

* `isSubscribed` - Whether or not the viewer is subscribed, by default `false`.



## Player Events

The player emits `PlayerEventInfo` to the event handler you inject into the player configuration.

The event info contains a reference to the `player`, the triggered `event` as well as a raw, event-specific `data` dictionary. It also provides functions for accessing typed data from the raw data dictionary, such as `url`, `value` and `calendarEvent`.

### Events

The following player events are currently supported:

* `addProductToCart`- Emitted when an item is added to the cart.
* `addShowToCalendar`- Emitted when an add to calendar button is tapped.
* `checkoutCart`- Emitted when the cart checkout button is tapped.
* `hideCart`- Emitted when the cart should be hidden.
* `hideChatOverlay`- Emitted when the chat overlay should be hidden.
* `hideProductList`- Emitted when a product list should be hidden.
* `playerDidBecomeReady`- Emitted when the player becomes ready for interaction.
* `playerDidClose`- Emitted when the player closes and will be deallocated.
* `playerDidLoad`- Emitted when the player completes loading the show.
* `playerDidSwipeDown`- Emitted when the user swipes down on the player.
* `playerDidSwipeLeft`- Emitted when the user swipes left on the player.
* `playerDidSwipeRight`- Emitted when the user swipes right on the player.
* `playerDidSwipeUp`- Emitted when the user swipes up on the player.
* `provideProductData`- Emitted when the player requests you to provide product data.
* `shareShow`- Emitted when the share button is tapped.
* `showCart`- Emitted when the cart should be presented.
* `showChatOverlay`- Emitted when the chat overlay should be presented.
* `showProductList`- Emitted when a product list should be presented.
* `showProductView`- Emitted when product information should be presented.
* `subscribe`- Emitted when the user taps `subscribe`.
* `syncCartState`- Emitted when the player needs information regarding the cart.
* `unsubscribe`- Emitted when the user taps `unsubscribe`.
* `updateItemInCart`- Emitted when the user changes the quantity of any items in the card.
* `updateShowStatus`- Emitted whenever the show status updates (e.g. pending, ready).



## Picture-in-Picture

Bambuser Live Video Shopping Player supports native picture-in-picture (referred to as `PiP` in the text below).


### Manual PiP

The `LiveVideoShoppingPlayerInterface` has functionality that can be called to enter and exit PiP mode manually.

The interface can also tell you whether or not the player is currently in PiP mode.


### Automatic PiP enabling

`BambuserLiveVideoShoppingPlayer` will automatically enable PiP mode when the user leaves the app.

This behavior is only supported in iOS 14.2 and later, and can be configured with the player configuration's `pipConfig`.


### Automatic PiP restore

`BambuserLiveVideoShoppingPlayer` will keep a PiP player alive even if the user leaves the video screen.

* If the user leaves the app while PiP is active, exiting PiP will open the app and pop the player back into its original frame
* If the user is on the same screen when exiting PiP mode, the player will automatically restore to its original frame.
* If the app is no longer on the same screen when exiting PiP mode, the developer has to restore the player manuallu. 

In `SwiftUI`, a view can use the `pictureInPictureRestore { ... }` view modifier to listen for restore events.

In `UIKit`, any class (view, view controller, service etc.) can call `registerPictureInPictureRestoreAction { ... }` to listen for restore events.

There can only be a single active restore event listener. Registering a listener will replace any previously registered listener. 



## Demo apps

The `Demo` folder contains a `SwiftUI` and a `UIKit` demo app. 

Have a look at these apps for examples on how to add a live shopping player to your app and configure it, handle PiP etc.



[ReleaseNotes]: ./RELEASE_NOTES.md
