//
//  KeyboardViewController.swift
//  KeyboardPro
//
//  Created by Daniel Saidi on 2023-02-13.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
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
/// See the `Keyboard` target for a simplified keyboard demo.
///
/// > Important: See ``DemoApp`` for important demo-specific
/// information on why the in-app settings doesn't sync with
/// this keyboard, and how you can enable this.
class KeyboardViewController: KeyboardInputViewController {

    /// This function is called when the controller launches.
    ///
    /// Call `setup(for:)` here to set up the controller for
    /// the `.keyboardKitDemo` app.
    override func viewDidLoad() {

        /// 💡 Always call super :)
        super.viewDidLoad()

        /// ‼️ Set up the keyboard for `.keyboardKitDemo`.
        super.setupPro(for: .keyboardKitDemo) { result in

            /// 💡 Make state & service customizations.
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

        /// 💡 Always call super :)
        super.viewWillSetupKeyboardView()

        /// 💡 Call `setupKeyboardView(...)` to customize or
        /// replace the standard `KeyboardView`.
        ///
        /// ‼️ Try avoid passing on `self` or the controller.
        /// If you must pass it on, make sure that the `self`
        /// reference is weak and that your custom view uses
        /// an `unowned` controller property, otherwise your
        /// controller reference will cause a memory leak.
        setupKeyboardView { /*[weak self]*/ controller in
            DemoKeyboardView(
                controller: controller
            )
        }
    }
}

private extension KeyboardViewController {

    /// Make demo-specific service changes.
    func setupDemoServices() {

        /// 💡 Set up a demo-specific action handler.
        services.actionHandler = DemoActionHandler(
            controller: self
        )

        /// 💡 Set up a demo-specific layout service with an
        /// optional additional bottom key.
        services.layoutService = DemoLayoutService(
            extraKey: .rocket
        )

        /// 💡 Set up a demo-specific keyboard style service.
        services.styleService = (try? DemoStyleService(
            keyboardContext: state.keyboardContext,
            themeContext: state.themeContext
        )) ?? services.styleService
    }

    /// Make demo-specific state changes.
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
