# Getting Started

This article describes how to get started with KeyboardKit.

@Metadata {

    @PageImage(
        purpose: card,
        source: "Page",
        alt: "Page icon"
    )

    @PageColor(blue)
}


This article describes how to get started with KeyboardKit and KeyboardKit Pro. Each section will first show you how to do something specific for KeyboardKit, then for KeyboardKit Pro.



## How to use KeyboardKit

Keyboard extensions can use KeyboardKit to create custom keyboards, while the main app can use it to check keyboard state, provide keyboard-specific settings, link to System Settings, etc.



## How to set up KeyboardKit for a keyboard extension

To set up KeyboardKit for a keyboard extension, import KeyboardKit and let `KeyboardViewController` inherit ``KeyboardInputViewController`` instead of ``UIInputViewController``:

```swift
import KeyboardKit // or KeyboardKitPro

class KeyboardController: KeyboardInputViewController {}
```

This gives you access to lifecycle functions like ``KeyboardInputViewController/viewWillSetupKeyboard()``, observable ``KeyboardInputViewController/state``, keyboard ``KeyboardInputViewController/services``, and more.

To use the standard ``KeyboardView``, which mimics a native iOS keyboard, you don't have to do anything else. KeyboardKit will set up everything for you.

To replace or customize the ``KeyboardView``, just override ``KeyboardInputViewController/viewWillSetupKeyboard()`` and call any setup function, for instance:

```swift
class KeyboardViewController: KeyboardInputViewController {

    override func viewWillSetupKeyboard() {
        super.viewWillSetupKeyboard()
        setup { [weak self] controller in // <-- Use [weak self] or [unowned self] if you need self here.
            KeyboardView(
                state: controller.state,
                services: controller.services,
                buttonContent: { $0.view },
                buttonView: { $0.view },
                emojiKeyboard: { $0.view },
                toolbar: { _ in MyCustomToolbar() }
            )
        }
    }
}
```

You can use the view builder `controller` parameter to access ``KeyboardInputViewController/state``, ``KeyboardInputViewController/services`` and any other properties and functions you need.

> Warning: A very important thing to consider when you use `setup` or `setupPro` with a `view` builder, is that the `view` builder provides you with an `unowned` controller reference, since referring to `self` from the view builder can cause memory leaks. However, since this reference is a ``KeyboardInputViewController``, you must still use `self` if you must refer to a specific controller class. If you do, it is VERY important to add `[weak self]` or `[unowned self]` to the builder, otherwise `self` will cause a memory leak.


### 👑 KeyboardKit Pro

Unlike KeyboardKit, KeyboardKit Pro has a setup function that lets you register a license key, after which KeyboardKit Pro automatically sets up your license and unlocks all included locales and features.

To use KeyboardKit Pro with the default ``KeyboardView``, just call **setupPro** without a view in **viewDidLoad**:

```swift
import KeyboardKitPro

class KeyboardViewController: KeyboardInputViewController {

    func viewDidLoad() {
        super.viewDidLoad()
        setupPro(
            withLicenseKey: "your-license-key",
            locales: [...], // Define which locales to use (Basic & Silver licenses)  
            licenseError: { error in
                // This is called if the license registration fails.
            }
            licenseConfiguration: { license in
                // This is called if the license registration succeeds.
            }
        )
    }
}
```

To use KeyboardKit Pro with a custom view, just call **setupPro** and provide it with any custom view in ``KeyboardInputViewController/viewWillSetupKeyboard()``:

```swift
import KeyboardKitPro

class KeyboardViewController: KeyboardInputViewController {

    override func viewWillSetupKeyboard() {
        super.viewWillSetupKeyboard()
        setupPro(
            withLicenseKey: "your-license-key",
            locales: [...],
            licenseError: { error in ... }
            licenseConfiguration: { license in ... }
            view: { controller in
                // Return a customized KeyboardView or a custom view here
            }
        )
    }
}
```

The Basic license unlocks 1 locale, Silver unlocks 5 and Gold unlocks all supported locales. You can change locales once for each new version of your app, after which the locales will be persisted for that app version.

> Important: Since Basic, Silver, & monthly Gold licenses validate licenses over the Internet, your keyboard extension must enable Full Access to be able to make network requests. This is not needed for yearly Gold and custom licenses, which are validated on-device.  
 


## How to set up KeyboardKit for an app

You can use KeyboardKit in your main app, to check the enabled and Full Access status of a keyboard, provide keyboard settings, link to System Settings, etc. It's a great place for app settings, since it has more space. 


### 👑 KeyboardKit Pro

To set up KeyboardKit Pro in your main app, just register your license key as soon as the the application launches: 

```swift
import KeyboardKitPro

@main
struct MyApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
                .task { setupKeyboardKitPro() }
        }
    }
}

extension MyApp {

    func setupKeyboardKitPro() async throws {
        do {
            let license = try await License.register(...)
            // KeyboardKit Pro is now activated.
        } catch {
            print(error)
            // Handle the license error in any way you want.
        }
    }
}
```

If you need to use Pro features on the root screen, just set some observed state when the license is registered to force a view update.



## How to set up KeyboardKit as a package dependency

To set up KeyboardKit as a transient package dependency, just add it to package dependencies and link it to any target that needs it.


### 👑 KeyboardKit Pro

Since KeyboardKit Pro is a binary target, it requires some special handling to be used as a transient package dependency:

* You don't have to link to KeyboardKit Pro from any target.
* You *must* update **runpath search paths** under **Build Settings**.
    * For the main app, set it to **@executable_path/Frameworks**.
    * For the keyboard, set it to **@executable_path/../../Frameworks**.

Failing to set the search paths will cause a runtime crash when you try to use KeyboardKit Pro.  



## How to use KeyboardKit state & services

The main ``KeyboardInputViewController`` provides you with keyboard-specific observable ``KeyboardInputViewController/state`` and ``KeyboardInputViewController/services``, that let you build powerful keyboards. 

### State

KeyboardKit injects all the observable state into the view hierarchy as environment objects when you set it up, which lets you access the various state types like this:

```swift
struct CustomKeyboard: View {

    init(
        actionHandler: KeyboardActionHandler
    ) {
        self.actionHandler = actionHandler
    }

    let actionHandler: KeyboardActionHandler

    @EnvironmentObject
    private var context: KeyboardContext

    var body: some View {
        ...
    }
}
```

The observable state types lets you configure the keyboard and its various features. They provide both observable properties and auto-persisted ones, based on how each property should work.

### Services

Services are not injected into the view hierarchy, and must be passed around. KeyboardKit uses init injection for both state and services. Examples of services are the ``KeyboardActionHandler`` which handles ``KeyboardAction``s, ``FeedbackService``, etc.

You can easily modify any state and replace any service with custom implementations. For instance, here we disable autocomplete with the shared ``AutocompleteContext`` and replace the standard ``KeyboardActionHandler`` with a custom one:

```swift
class KeyboardViewController: KeyboardInputViewController {

    override func viewDidLoad() {
        services.actionHandler = CustomActionHandler(
            inputViewController: self
        )
        super.viewDidLoad()
        state.autocompleteContext.isAutocompleteEnabled = false
    }
}

class CustomActionHandler: StandardActionHandler {

    open override func handle(
        _ gesture: KeyboardGesture, 
        on action: KeyboardAction
    ) {
        if gesture == .press && action == .space {
            print("Pressed space!")
        }
        super.handle(gesture, on: action) 
    }
}
```

Since services are lazy and resolved when they're used for the first time, you should set up any custom services as early as possible, to ensure that the dependency graph is properly resolved.



## Going further

You should now have a basic understanding of how to set up KeyboardKit and KeyboardKit Pro. For more information & examples, see the <doc:Essentials> article, as well as the other articles. Also, take a look at the demo app.



[KeyboardKit]: https://github.com/KeyboardKit/KeyboardKit
[KeyboardKitPro]: https://github.com/KeyboardKit/KeyboardKitPro
