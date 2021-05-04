//
//  BindingHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 29/12/2020.
//  Copyright © 2020 DiLieDevs. All rights reserved.
//

import SwiftUI

public extension Binding {
    func onChange(_ perform: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { wrappedValue },
            set: {
                wrappedValue = $0
                perform()
            }
        )
    }
}

public extension Binding where Value == PresentationMode {
    /// Dismisses the view that is presented when the binding is a `PresentationMode`.
    func dismiss() {
        wrappedValue.dismiss()
    }
}

public extension ColorScheme {
    /// Returns `true` if the color scheme is dark.
    var isDark: Bool { self == .dark }
}
