# Player Configuration

You can use a `PlayerConfiguration` to configure the player instance. 

The player configuration specifies the following configuration parameters, most optional:

* `engine` - The player engine to use, by default `.standard`.
* `audioConfig` - The audio configuration to use, by default `.standard`.
* `localeInfo` - The locale info to use, by default `.standard`.
* `pipConfig` - The picture-in-picture configuration to use, by default `.standard`.
* `shareConfig` - The share configuration info to use, by default `.standard`.
* `streamerInfo` - Information about the streamer, by default `.standard`.
* `uiConfig` - The UI configuration to use, by default `.standard`.
* `eventHandler` - A mandatory event handler to use for listening to player events.


## PlayerLocaleInfo

This type specifies the following locale information:

* `locale` - The locale identifier, by default `nil`.
* `currency` - The local currency, by default `nil`.
* `trimPriceTrailingZeros` - Whether or not to trim trailing zeros in the price, by default `false`.


## PictureInPictureConfiguration

This type specifies the following PiP configurations:

* `isEnabled` - Whether or not picture-in-picture is enabled, by default `true`.
* `isAutomatic` - Whether or not picture-in-picture should autostart, by default `true`.

`isAutomatic` is only supported from iOS 14.2 and later.


## PlayerShareConfiguration

This type specifies the following share configurations:

* `autoplay` - Whether or not to use autoplay when sharing, by default `.enabled`.
* `baseUrl` - The base URL, if any, to apply to share URLs, by default `nil`.


## PlayerStreamerInfo

This type specifies the following streamer information:

* `name` - The streamer's name, by default `nil` 
* `avatar` - The streamer's avatar, by default `nil`


## PlayerUIConfiguration

This type specifies the following UI configurations:

* `actionBar` - The visibility of the action bar, by default `.visible`.
* `cartView` - The visibility of the cart view, by default `.visible`. 
* `cartButton` - The visibility of the cart button, by default `.visible`.
* `chatOverlay` - The visibility of the chat overlay, by default `.visible`.
* `emojiOverlay` - The visibility of the emoji overlay, by default `.visible`.
* `productList` - The visibility of the product list, by default `.visible`.
* `productView` - The visibility of the product view, by default `.visible`.
* `shareButton` - The visibility of the share button, by default `.hidden`.
