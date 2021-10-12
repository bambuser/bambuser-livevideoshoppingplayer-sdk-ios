# Picture-in-Picture

Bambuser Live Video Shopping Player supports native picture-in-picture (referred to as `PiP` in the text below).


## Important information

For PiP to work, your application must enable the `Background Modes` capability and check the `Audio, AirPlay, and Picture-in-picture` checkbox.

PiP only works on real iPhone and iPad devices, not in iOS and iPadOS simulators.

Automatic PiP (read more below) requires iOS 14.2 and later.


## Manual PiP

The `LiveVideoShoppingPlayerInterface` has functionality that can be called to enter and exit PiP mode manually. The interface can also tell you whether or not the player is currently in PiP mode.

Manual PiP can be useful if you for instance want to enable PiP before navigating to another part of your app, e.g. a product screen.


## Automatic PiP enabling

`BambuserLiveVideoShoppingPlayer` will automatically enable PiP mode when the user leaves the app. This behavior is only supported in iOS 14.2 and later, and can be configured with the player configuration's `pipConfig`.


## Automatic PiP restoration

`BambuserLiveVideoShoppingPlayer` will keep a PiP mini player alive, even if the user leaves the video player screen, either by popping the screen off the navigation stack, pushing to a new screen in the navigation stack, present a sheet or fullscreen modal above the screen etc. 

The SDK will also try to restore the original video player automatically, if possible.

The behavior is as such: 

* If the user leaves the app while PiP is active, exiting PiP by tapping on the exit button in the mini player will open the app and pop the player back into its original frame.
* If the user is on the same screen when exiting PiP, either programatically or by tapping on the button in the mini player, the player will automatically pop back into its original frame.
* If the app is no longer on the same screen when exiting PiP mode, the developer has to restore the player manually.

Read on for information on how to perform manual PiP restoration.


## Manual PiP restoration 

Manual PiP restoration is required when the screen that started the PiP video is no longer available.

The SDK will then give you a chance to restore the video player manually. This works differently in SwiftUI and UIKit:

* In `SwiftUI`, any view can use the `pictureInPictureRestore { ... }` view modifier to listen for restore events. The last view that calls this function will be the active restore listener. You can use `onAppear` to keep this registration fresh.
* In `UIKit`, any class (view, view controller, service etc.) can call `registerPictureInPictureRestoreAction { ... }` to listen for restore events.

There can only be a single active restore event listener. Registering a listener will replace any previously registered listener.

When the SDK requires a manual PiP restoration, the action you have provided will be called. This will give you the original player as well as information about the show. Use this to restore the player or create a new screen that presents the same show. 
