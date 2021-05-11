<div>
  <br/><br />
  <p align="center">
    <a href="https://bambuser.com" target="_blank" align="center">
        <img src="https://brand.bambuser.net/current/logo/bambuser-black-512.png" width="280">
    </a>
  </p>
  <br/><br />
</div>


# Bambuser LiveShopping Player

`BambuserLiveShoppingPlayer` is a Swift-based library that simplies
adding a Bambuser live shopping player to any iOS app.


## Installation

### Swift Package Manager

You can install `BambuserLiveShoppingPlayer` with SPM:

```
https://github.com/bambuser/bambuser-liveshopping-player-sdk-ios
```

After installing and adding the library to your app, remember to import
it in every file where you want to use it.


## Platform Support

The library supports iOS 13+ and can be used with `UIKit` and `SwiftUI`.


### UIKit

When using `UIKit`, you can create a player like this:

```
let player = LiveShoppingPlayerView(
    showId: "The ID of the show to watch",
    configuration: yourConfiguration)
```

You can then add the player anywhere in your app, resize it to fit your
needs etc. Read more about configuration the player further down.


### SwiftUI

When using `SwiftUI`, you can create a player like this:

```
let player = LiveShoppingPlayer(
    showId: "The ID of the show to watch",
    configuration: yourConfiguration)
```

You can then add the player anywhere in your app, resize it to fit your
needs etc. Read more about configuration the player further down.


## Configuration

You can use a `LiveShoppingPlayerConfiguration` to configure
your live shopping player. The configuration specifies the following:

* `theme` - You can use the `.standard` theme or a specific `.name`.
* `features` - You can define a list of features to enable or disable.

Just inject a configuration when creating a player, and it will adjust accordingly.


## Demo apps

The `Demo` folder contains two demo apps - one for `UIKit` and one
for `SwiftUI`. Have a look at them for examples on how to add a
live shopping player to your app, enable Picture-in-Picture etc.
