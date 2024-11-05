//
//  Keyboard+RootView.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2022-02-04.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

extension Keyboard {
    
    /// This view is used as a wrapper view, to make sure it
    /// binds to state that affects your layout.
    struct RootView<ViewType: View>: View {
        
        init(@ViewBuilder _ view: @escaping () -> ViewType) {
            self.view = view
        }
        
        var view: () -> ViewType
        
        @EnvironmentObject
        private var autocompleteContext: AutocompleteContext

        @EnvironmentObject
        private var calloutContext: KeyboardCalloutContext

        @EnvironmentObject
        private var dictationContext: DictationContext

        @EnvironmentObject
        private var feedbackContext: FeedbackContext

        @EnvironmentObject
        private var keyboardContext: KeyboardContext

        @EnvironmentObject
        private var keyboardSettings: KeyboardSettings


        var body: some View {
            view()
        }
    }
}
