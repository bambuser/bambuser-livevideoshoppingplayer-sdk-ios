<div>
  <br/><br />
  <p align="center">
    <a href="https://bambuser.com" target="_blank" align="center">
        <img src="https://brand.bambuser.net/current/logo/bambuser-black-512.png" width="280">
    </a>
  </p>
  <br/><br />
</div>


# Bambuser Live Video Shopping Player

`BambuserLiveShoppingPlayer` simplifes the integration of the Bambuser Live Video Shopping player in any iOS app.


## Installation

### Swift Package Manager

You can install `BambuserLiveShoppingPlayer` with SPM:

```
https://github.com/bambuser/bambuser-liveshopping-player-sdk-ios
```

After installing the library in your app, remember to import `BambuserLiveShoppingPlayer` in every file where you want to use it.


## Platform Support

The library supports iOS 13+ and can be used with `UIKit` and `SwiftUI`.


### UIKit

When using `UIKit`, you can create a player like this:

```
let player = LiveShoppingPlayerView(
    configuration: playerConfiguration)
```

You can then add the player anywhere in your app, resize it to fit your needs etc. Read more about configuration the player further down.

You can also use the `LiveShoppingPlayerViewController` if you want to wrap the view.


### SwiftUI

When using `SwiftUI`, you can create a player like this:

```
let player = LiveShoppingPlayer(
    showId: "The ID of the show to watch",
    configuration: playerConfiguration)
```

You can then add the player anywhere in your app, resize it to fit your needs etc. Read more about configuring the player further down.


## Player Configuration

You can use a `PlayerConfiguration` to configure your live shopping player. 

The configuration specifies things like theme, UI element, button configuration, event handlings etc.


## Demo apps

The `Demo` folder contains a `SwiftUI` demo app. 

Have a look at it for examples on how to add a live shopping player to your app.
