# ``KeyboardKit``

KeyboardKit is a Swift SDK that lets you create fully customizable keyboards in SwiftUI.


## Overview

![KeyboardKit logo](Logo.png)

KeyboardKit lets you create fully customizable [keyboard extensions][About] in a few lines of code, using SwiftUI. It extends Apple's limited APIs and provides you with a lot more functionality than what is otherwise available.

KeyboardKit is open-source and completely free to use. It can be extended with [KeyboardKit Pro][Pro] to unlock a bunch of pro features, like fully localized keyboards, autocomplete, AI-enabling features, and much more.  



## Installation

KeyboardKit can be installed with the Swift Package Manager:

```
https://github.com/KeyboardKit/KeyboardKit.git
```

After installing KeyboardKit, make sure to link it to all targets that need it.



## Getting Started

The <doc:Getting-Started> guide helps you get started with KeyboardKit, and the <doc:Essentials> article describes the essential types in the library.

> Important: You should also read the <doc:Essentials-Memory-Management> article about the *very* strict memory limitations that Apple puts on keyboard extensions. Learn how to avoid memory-leaks, keep within the limits, and how to monitor your memory consumption.



## Supported Locales

KeyboardKit supports **71** keyboard-specific ``Foundation/Locale``s:

🇺🇸 🇦🇱 🇦🇪 🇦🇲 🇧🇾 🇧🇬 🇦🇩 🏳️ 🏳️ 🇭🇷  <br />
🇨🇿 🇩🇰 🇳🇱 🇧🇪 🇦🇺 🇨🇦 🇬🇧 🇺🇸 🇪🇪 🇫🇴  <br />
🇵🇭 🇫🇮 🇫🇷 🇨🇦 🇧🇪 🇨🇭 🇬🇪 🇩🇪 🇦🇹 🇨🇭  <br />
🇬🇷 🇺🇸 🇮🇱 🇭🇺 🇮🇸 🏳️ 🇮🇩 🇮🇪 🇮🇹 🇰🇿  <br />
🇹🇯 🇹🇯 🇹🇯 🇱🇻 🇱🇹 🇲🇰 🇲🇾 🇲🇹 🇲🇳 🏳️  <br />
🇳🇴 🇳🇴 🇮🇷 🇵🇱 🇵🇹 🇧🇷 🇷🇴 🇷🇺 🇷🇸 🇷🇸  <br />
🇸🇰 🇸🇮 🇪🇸 🇦🇷 🇲🇽 🇸🇪 🇰🇪 🇹🇷 🇺🇦 🇺🇿  <br />
🏴󠁧󠁢󠁷󠁬󠁳󠁿  <br />

[KeyboardKit Pro][Pro] unlocks localized callouts, input sets, layouts & services for all supported locales, as shown in the <doc:Localization-Article> article.



## Open-Source Features

KeyboardKit comes packed with features to help you build amazing keyboard extensions:

* 🌱 <doc:Essentials> - Essential utilities, models, services & views.
* ⌨️ <doc:Essentials-KeyboardView> - Render a native-looking, customizable iOS keyboard.
* 💥 <doc:Actions-Article> - Trigger & handle keyboard-related actions.
* 📱 <doc:App-Article> - Define and set up your app, settings, etc.
* 💡 <doc:Autocomplete-Article> - Perform autocomplete as the user types.
* 🗯 <doc:Callouts-Article> - Show input & secondary action callouts.
* 🖥️ <doc:Device-Article> - Identify device type, device capabilities, etc.
* 😀 <doc:Emojis-Article> - Emojis, categories, versions, skin tones, etc.
* 🔉 <doc:Feedback-Article> - Trigger audio & haptic feedback with ease.
* 👆 <doc:Gestures-Article> - Handle a rich set of gestures on any key.
* 🏠 <doc:Host-Article> - Identify the host application.
* 🔣 <doc:Layout-Article> - Define and customize dynamic keyboard layouts.
* 🌐 <doc:Localization-Article> - Localize your keyboard in **71 locales**.
* 🗺️ <doc:Navigation-Article> - Open urls and other apps from the keyboard.
* 👁 <doc:Previews-Article> - Extensive SwiftUI preview support.
* 📄 <doc:Proxy-Article> - Extend the text document proxy with more capabilities.
* ⚙️ <doc:Settings-Article> - Provide keyboard settings & link to System Settings.
* 🩺 <doc:Status-Article> - Detect if a keyboard is enabled, has full access, etc.
* 🎨 <doc:Styling-Article> - Style your keyboard to great extent.



## Pro Features

You can upgrade to [KeyboardKit Pro][Pro] to unlock Pro features.

* 🌱 <doc:Essentials> - More essential tools, keyboard previews, etc.
* ⌨️ <doc:Essentials-KeyboardView> - Make the keyboard view do a lot more.
* 🤖 <doc:AI-Article> - Features that are needed for AI.
* 📱 <doc:App-Article> - App-specific screens & views.
* 💡 <doc:Autocomplete-Article> - On-device & remote autocomplete.
* 🗯 <doc:Callouts-Article> - Localized callouts for all locales.
* 🎤 <doc:Dictation-Article> - Trigger dictation from the keyboard.
* 😀 <doc:Emojis-Article> - A powerful emoji keyboard.
* ⌨️ <doc:External-Keyboards-Article> - Detect if an external keyboard is connected.
* 🏠 <doc:Host-Article> - Identify and open specific host applications.
* 🔣 <doc:Layout-Article> - Localized layouts for all locales.
* 🌐 <doc:Localization-Article> - Services & views for all locales.
* 👁 <doc:Previews-Article> - Keyboard & theme previews for in-app use.
* 📄 <doc:Proxy-Article> - Let ``UIKit/UITextDocumentProxy`` read the full document.
* 📝 <doc:Text-Input-Article> - Let users type within the keyboard.
* 🍭 <doc:Themes-Article> - A theme engine with many pre-defined themes.



## Demo & Inspiration

The demo app in the [KeyboardKit repository][SDK] lets you try out both KeyboardKit and KeyboardKit Pro. The [KeyboardKit app][App] on the App Store lets you try many pro features directly on your iPhone & iPad, without having to write any code.



## License

KeyboardKit is available under the MIT license.

[About]: https://keyboardkit.com/about
[App]: https://keyboardkit.com/app
[SDK]: https://github.com/KeyboardKit/KeyboardKit
[Pro]: https://github.com/KeyboardKit/KeyboardKitPro
[Website]: https://keyboard.com



## Topics

### Guides



### Essentials

- <doc:Getting-Started>
- <doc:Essentials>
- <doc:Essentials-KeyboardView>
- <doc:Essentials-Memory-Management>

### Articles

- <doc:Actions-Article>
- <doc:AI-Article>
- <doc:App-Article>
- <doc:Autocomplete-Article>
- <doc:Callouts-Article>
- <doc:Device-Article>
- <doc:Dictation-Article>
- <doc:Emojis-Article>
- <doc:External-Keyboards-Article>
- <doc:Feedback-Article>
- <doc:Gestures-Article>
- <doc:Host-Article>
- <doc:Layout-Article>
- <doc:Localization-Article>
- <doc:Navigation-Article>
- <doc:Previews-Article>
- <doc:Proxy-Article>
- <doc:Settings-Article>
- <doc:Status-Article>
- <doc:Styling-Article>
- <doc:Text-Input-Article>
- <doc:Themes-Article>

### Essentials

- ``Keyboard``
- ``KeyboardBehavior``
- ``KeyboardContext``
- ``KeyboardController``
- ``KeyboardInputViewController``
- ``KeyboardModel``
- ``KeyboardView``
- ``KeyboardViewComponent``
- ``KeyboardViewItem``

### Actions

- ``KeyboardAction``
- ``KeyboardActionHandler``

### Autocomplete

- ``Autocomplete``
- ``AutocompleteContext``
- ``AutocompleteService``

### App

- ``KeyboardApp``
- ``KeyboardAppView``

### Callouts

- ``KeyboardCallout``
- ``KeyboardCalloutContext``
- ``KeyboardCalloutService``

### Device

- ``DeviceType``
- ``InterfaceOrientation``

### Dictation

- ``Dictation``
- ``DictationContext``
- ``DictationService``
- ``DictationSpeechRecognizer``

### Emojis

- ``Emoji``
- ``EmojiCategory``
- ``EmojiKeyboard``
- ``EmojiVersion``

### External

- ``ExternalKeyboardContext``

### Feedback

- ``KeyboardFeedback``
- ``KeyboardFeedbackContext``
- ``KeyboardFeedbackService``

### Gestures

- ``Gestures``
- ``GestureButton``
- ``GestureButtonTimer``
- ``GestureButtonScrollState``
- ``DragGestureHandler``

### Host

- ``KeyboardHostApplication``
- ``KeyboardHostApplicationProvider``

### Layout

- ``InputSet``
- ``KeyboardLayout``
- ``KeyboardLayoutService``
- ``KeyboardLayoutServiceProxy``

### Localization

- ``KKL10n``
- ``Foundation/Locale``
- ``Localizable``
- ``LocalizedService``

### Navigation

- ``UrlOpener``

### Previews

- ``KeyboardPreviews``
- ``KeyboardViewPreview``

### Pro

- ``License``

### Proxy

- ``Proxy``

### Status

- ``KeyboardStatus``
- ``KeyboardStatusContext``

### Styling

- ``KeyboardFont``
- ``KeyboardStyle``
- ``KeyboardStyleService``

### Text Input

- ``KeyboardTextField``
- ``KeyboardTextView``

### Themes

- ``KeyboardTheme``
- ``KeyboardThemeContext``
- ``KeyboardThemeCopyable``
- ``KeyboardThemeStyleVariation``
