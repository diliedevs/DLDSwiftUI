//
//  SwiftUIView.swift
//  
//
//  Created by Dionne Lie-Sam-Foek on 29/12/2020.
//

import SwiftUI

@available(OSX 11.0, iOS 14.0, *)
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

@available(OSX 11.0, iOS 14.0, *)
public extension Binding where Value == PresentationMode {
    /// Dismisses the view that is presented when the binding is a `PresentationMode`.
    func dismiss() {
        wrappedValue.dismiss()
    }
}

@available(OSX 11.0, iOS 14.0, *)
public extension ColorScheme {
    /// Returns `true` if the color scheme is dark.
    var isDark: Bool { self == .dark }
}
