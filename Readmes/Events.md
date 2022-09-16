# Player Events

The player will emit `PlayerEventInfo` values to the event handler that you inject into the player configuration.

An event info value contains a reference to the `player`, the triggered `event` as well as a raw, event-specific `data` dictionary. It also provides functions for accessing typed data from the raw data dictionary, such as `url`, `value` and `calendarEvent`.

## Events

The following player events are currently supported:

* `addProductToCart`- Emitted when an item is added to the cart.
* `addShowToCalendar`- Emitted when an add to calendar button is tapped.
* `checkoutCart`- Emitted when the cart checkout button is tapped.
* `hideCart`- Emitted when the cart should be hidden.
* `hideChatOverlay`- Emitted when the chat overlay should be hidden.
* `hideProductList`- Emitted when a product list should be hidden.
* `openExternalUrl`- Emitted when user taps a link.
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
* `showEmojiBatch` - Emitted when an Emoji batch should be displayed.
* `showProductList`- Emitted when a product list should be presented.
* `showProductView`- Emitted when product information should be presented.
* `subscribe`- Emitted when the user taps `subscribe`.
* `syncCartState`- Emitted when the player needs information regarding the cart.
* `unsubscribe`- Emitted when the user taps `unsubscribe`.
* `updateItemInCart`- Emitted when the user changes the quantity of any items in the card.
* `updateShowStatus`- Emitted whenever the show status updates (e.g. pending, ready).

