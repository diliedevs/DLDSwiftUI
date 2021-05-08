//
//  LabeledButton.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 04/05/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

/// A `Button` view with a `Label` showing both a localizable title and a `SF Symbols` icon.
public struct LabeledButton: View {
    let label: Label<Text, Image>
    let action : () -> Void
    
    
    /// Creates a button with a label showing both a localizable title and a resource image icon.
    /// - Parameters:
    ///   - title: The title for the button as a `LocalizedStringKey`.
    ///   - name: The name of an image resource to lookup.
    ///   - action: The action for the button.
    public init(_ title: LocalizedStringKey, image name: String, action: @escaping () -> Void) {
        self.label  = Label(title, image: name)
        self.action = action
    }
    
    /// Creates a button with a label showing both a localizable title and a `SF Symbols` icon.
    /// - Parameters:
    ///   - title: The title for the button as a `LocalizedStringKey`.
    ///   - symbol: The symbol representing an `SF Symbol` icon.
    ///   - action: The action for the button.
    public init(_ title: LocalizedStringKey, symbol: Symbol, action @escaping () -> Void) {
        self.label = Label(title, symbol: symbol)
    }
    
    /// The content and behavior of the view.
    public var body: some View {
        Button(action: action) {
            label
        }
    }
}
