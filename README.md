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

The LVS player can be used to watch live and recorded shows, with UI overlays that lets users interact with the show.

The LVS player can be configured to great extent and also lets you listen for player emitted events and perform player-specific functions. 

`BambuserLiveVideoShoppingPlayer` supports iOS 13+ and can be used with `UIKit` and `SwiftUI`.



## Beta Version

This project is currently in beta. Feel free to experiment with it, but refrain from using it in production.  

See the [release notes][ReleaseNotes] for status and progress.



## Installation

Requires Xcode 12.5.0 or newer.

### Swift Package Manager

```
https://github.com/bambuser/bambuser-livevideoshoppingplayer-sdk-ios
```

After installing the SDK, you must import `BambuserVideoLiveShoppingPlayer` in every file where you want to use it.

### CocoaPods

Add ```pod 'BambuserLiveVideoShoppingPlayer', :git => 'https://github.com/bambuser/bambuser-livevideoshoppingplayer-sdk-ios'``` to your Podfile.

### Carthages

This SDK does not support Carthage.



## Getting started

### Documentation

You can download the latest DocC documentation [here][Documentation].

Just extract the downloaded file and double-tap the `.doccarchive` file to view the documentation in Xcode. 


### UIKit

With `UIKit`, you can create a player like this:

```
let player = LiveVideoShoppingPlayerView(
    showId: "The ID of the show to watch",
    configuration: playerConfiguration)
```

You can then add the player anywhere in your app, resize it to fit your needs etc.


### SwiftUI

With `SwiftUI`, you can create a player like this:

```
let player = LiveVideoShoppingPlayer(
    showId: "The ID of the show to watch",
    configuration: playerConfiguration)
```

You can then add the player anywhere in your app, resize it to fit your needs etc.



## Player Configuration

You can use a `PlayerConfiguration` to configure the player instance. 

[Read more here][Configuration] to learn about how to configure the player, UI overlays, event listeners etc.



## Player Events

The player will emit `PlayerEventInfo` values to the event handler that you inject into the player configuration.

[Read more here][Events] to learn about listening for events, extracting data etc.



## Picture-in-Picture

Bambuser Live Video Shopping Player supports native picture-in-picture (referred to as `PiP` in the text below).

[Read more here][PictureInPicture] to learn about manual and automatic PiP enabling, PiP restoration etc. 



## Demo apps

The `Demo` folder contains a `SwiftUI` and a `UIKit` demo app. 

Have a look at these apps for examples on how to add a live shopping player to your app and configure it, handle PiP etc.



[Documentation]: ./Docs/BambuserLiveVideoShoppingPlayer.doccarchive.zip
[ReleaseNotes]: ./RELEASE_NOTES.md

[Configuration]: ./Readmes/Configuration.md
[Events]: ./Readmes/Events.md
[PictureInPicture]: ./Readmes/PictureInPicture.md
