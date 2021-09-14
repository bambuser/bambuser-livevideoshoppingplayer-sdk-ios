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

`BambuserLiveVideoShoppingPlayer` is a Swift-based SDK for iOS, that aims to simplify adding a Bambuser Live Video Shopping Player to your app.

The SDK lets you add a player to your app, applying a configuration that controls how it looks and behaves. Once the player is loaded, you can listen for events that are emitted by the player. 

The SDK supports iOS 13+ and can be used with `UIKit` and `SwiftUI`.



## Beta Version

This project is in early stages of development. Feel free to experiment with it, but refrain from using it in production for now. 

Although the SDK will follow semver after the first major release, it will have breaking changes between minor versions until then.

Some current limitations are that it's not currently possible to listen to all available events. 

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

Read more about configuration the player further down and have a look at the UIKit demo for examples.


### SwiftUI

With `SwiftUI`, you can create a player like this:

```
let player = LiveVideoShoppingPlayer(
    showId: "The ID of the show to watch",
    configuration: playerConfiguration)
```

You can then add the player anywhere in your app, resize it to fit your needs etc. 

Read more about configuration the player further down and have a look at the SwiftUI demo for examples.



## Player Configuration

You can use a `PlayerConfiguration` to configure the player instance. 

The player configuration specifies the following configuration parameters, of which most are optional:

* `engine` - The engine to use, by default `.standard`.
* `audioConfig` - The audio configuration to use, by default `.standard`.
* `buttonConfig` - The button configuration to use, by default `.standard`.
* `isViewerSubscribed` - Whether or not the viewer is subscribed, by default `false`.
* `localeInfo` - The locale info to use, by default `.standard`.
* `shareAutoplay` - Whether or not to use autoplay when sharing shows, by default `.enabled`.
* `shareBaseUrl` - The base URL to apply to share URLs, by default `nil`.
* `streamerInfo` - The streamer info to use, by default `.standard`.
* `uiConfig` - The UI configuration to use, by default `.standard`.
* `eventHandler` - The event handler to use for listening to player events.

### PlayerConfiguration.Button

This type specifies the following button configurations:

* `checkout` - The behavior of the checkout button 
* `dismiss` - The behavior of the dismiss button
* `product` - The behavior of product buttons

### PlayerConfiguration.LocaleInfo

This type specifies the following locale information:

* `locale` - An optional string that describes the current locale
* `currency` - An optional string that describes the current currency 
* `trimPriceTrailingZeros` - Whether or not to trim trailing zeros in product prices

### PlayerConfiguration.StreamerInfo

This type specifies the following streamer information:

* `name` - An optional string that describes the streamer name 
* `avatar` - An optional string that describes the streamer avatar

### PlayerConfiguration.UIConfiguration

This type specifies the following UI configurations:

* `cartView` - The enabled state of the cart view 
* `cartButton` - The enabled state of the cart button
* `chatOverlay` - The enabled state of the chat overlay
* `productList` - The enabled state of the product list
* `productView` - The enabled state of the product view
* `shareButton` - The enabled state of the share button
* `subscribeButton` - The enabled state of the subscribe button


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

Bambuser Live Video Shopping Player will automatically enable PiP mode when the user leaves the app.

This automatic behavior will be configurable in a future version of the SDK.

### Automatic PiP disposal

Bambuser Live Video Shopping Player will automatically dispose itself together with the parent screen.

While this is a feature in most cases, this may get in the way of any in-app PiP navigation you may want to have in your app, since entering PiP and then back away from the video player screen, will cause the PiP player to be disposed.

This automatic disposal will be configurable in a future version of the SDK, to make it easy to keep a PiP player alive. 

Until this feature is implemented, you could try holding on to the player or screen instance and manage the disposal and restoration manually. 


## Demo apps

The `Demo` folder contains a `SwiftUI` and a `UIKit` demo app. 

Have a look at these apps for examples on how to add a live shopping player to your app.



[ReleaseNotes]: ./RELEASE_NOTES.md
