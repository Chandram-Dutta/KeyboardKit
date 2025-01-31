//
//  KeyboardViewController.swift
//  KeyboardPro
//
//  Created by Daniel Saidi on 2023-02-13.
//  Copyright © 2023-2025 Daniel Saidi. All rights reserved.
//

import KeyboardKitPro
import SwiftUI

/// This keyboard demonstrates how to set up KeyboardKit Pro
/// with a `KeyboardApp` and customize the standard keyboard
/// and its state and services.
///
/// This demo lets you test most that KeyboardKit Pro has to
/// offer, e.g. all localized keyboards, autocomplete, emoji
/// keyboard & emoji search, dictation, themes, etc.
///
/// See the `Keyboard` target for a simplified keyboard demo,
/// and the `DemoApp.swift` for more info about the demo app.
class KeyboardViewController: KeyboardInputViewController {

    /// This function is called when the controller launches.
    ///
    /// Call `setup(for:)` here to set up the controller for
    /// the `.keyboardKitDemo` app.
    override func viewDidLoad() {

        /// 💡 Always call super.viewDidLoad()!
        super.viewDidLoad()

        /// ‼️ Set up the keyboard for `.keyboardKitDemo`.
        super.setupPro(for: .keyboardKitDemo) { result in

            /// 💡 Customize the keyboard's state & services.
            self.setupDemoServices()
            self.setupDemoState()
        }
    }

    /// This function is called when the controller needs to
    /// create or update the keyboard view.
    ///
    /// Call `setupKeyboardView(_:)` here to set up a custom
    /// keyboard view or customize the default `KeyboardView`.
    override func viewWillSetupKeyboardView() {
        
        /// 💡 Don't call `super.viewWillSetupKeyboardView()`.
        // super.viewWillSetupKeyboardView()
        
        /// 💡 Call `setupKeyboardView(...)` to customize or
        /// replace the standard `KeyboardView`.
        ///
        /// ‼️ Avoid passing on `self` and `controller` to a
        /// custom view. If you must, make sure to use `weak`
        /// or `unowned` for `self`, and that your view uses
        /// an `unowned` controller property. Otherwise, you
        /// will cause a memory leak.
        setupKeyboardView { /*[weak self]*/ controller in
            DemoKeyboardView(
                controller: controller
            )
        }
    }
}

private extension KeyboardViewController {

    /// Make demo-specific changes to your keyboard services.
    func setupDemoServices() {

        /// 💡 Set up a demo-specific action handler.
        services.actionHandler = DemoActionHandler(
            controller: self
        )

        /// 💡 Set up a demo-specific layout service with an
        /// optional additional bottom key.
        services.layoutService = DemoLayoutService(
            // extraKey: .rocket
            extraKey: .localeSwitcher
        )

        /// 💡 Set up a demo-specific keyboard style service.
        services.styleService = (try? DemoStyleService(
            keyboardContext: state.keyboardContext,
            themeContext: state.themeContext
        )) ?? services.styleService
    }

    /// Make demo-specific changes to your keyboard's state.
    ///
    /// 💡 Many setting changes can be made from the toolbar.
    func setupDemoState() {

        /// 💡 Set up which locale to use to present locales.
        state.keyboardContext.localePresentationLocale = .current

        /// 💡 Configure the space key's long press behavior.
        state.keyboardContext.spaceLongPressBehavior = .moveInputCursor
        // state.keyboardContext.spaceLongPressBehavior = .openLocaleContextMenu

        /// 💡 Disable autocorrection.
        // state.autocompleteContext.isAutocorrectEnabled = false

        /// 💡 Setup demo-specific haptic & audio feedback.
        let feedback = state.feedbackContext
        feedback.registerCustomFeedback(.haptic(.selection, for: .repeat, on: .rocket))
        feedback.registerCustomFeedback(.audio(.rocketFuse, for: .press, on: .rocket))
        feedback.registerCustomFeedback(.audio(.rocketLaunch, for: .release, on: .rocket))
    }
}
