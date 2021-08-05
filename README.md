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

`BambuserLiveVideoShoppingPlayer` simplifes adding a Bambuser Live Video Shopping Player to your iOS app.

The SDK lets you add a `player` to your app and apply a `configuration` that controls how it looks and behaves. Once the player is loaded, you can listen for `events` that are emitted by the player and trigger `functions` that are executed within the player. 

The SDK supports iOS 13+ and can be used with `UIKit` and `SwiftUI`.



## Beta Version

This project is in early stages of development. Feel free to experiment with it, but refrain from using it in production for now.

Some current limitations are that it's not possible to use native PiP or listen to all available events. 

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

Read more about configuration the player further down.


### SwiftUI

With `SwiftUI`, you can create a player like this:

```
let player = LiveVideoShoppingPlayer(
    showId: "The ID of the show to watch",
    configuration: playerConfiguration)
```

You can then add the player anywhere in your app, resize it to fit your needs etc. 

Read more about configuring the player further down.



## Player Configuration

You can use a `PlayerConfiguration` to configure the player instance. 

The configuration specifies things like base url, theme, UI elements, button configuration, event handling etc.

[Read more here][Configuration]



## Player Events

The player emits `PlayerEventInfo` to an event handler that you can inject to listen for the events.

Some events regard the player lifecycle, product information, ui events etc.

[Read more here][Events]



## Demo apps

The `Demo` folder contains a `SwiftUI` demo app. 

Have a look at it for examples on how to add a live shopping player to your app.


[Configuration]: ./Readmes/Configuration.md
[Events]: ./Readmes/Configuration.md
[ReleaseNotes]: ./RELEASE_NOTES.md
[WebDoc]: https://www.notion.so/bambuser/Player-API-Reference-b4f08158b5fc4e3ab892375b1a742e84
