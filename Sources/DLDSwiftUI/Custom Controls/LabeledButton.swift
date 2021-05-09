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
    ///   - title: A string to used as the label’s title.
    ///   - name: The name of an image resource to lookup.
    ///   - action: The action for the button.
    public init<S: StringProtocol>(_ title: S, image name: String, action: @escaping () -> Void) {
        self.label  = Label(title, image: name)
        self.action = action
    }
    
    /// Creates a button with a label showing both a localizable title and a `SF Symbols` icon.
    /// - Parameters:
    ///   - title: A string to used as the label’s title.
    ///   - name: The name of an `SF Symbol` icon.
    ///   - action: The action for the button.
    public init<S: StringProtocol>(_ title: S, systemImage name: String, action: @escaping () -> Void) {
        self.label  = Label(title, systemImage: name)
        self.action = action
    }
    
    /// Creates a button with a label showing both a localizable title and a `SF Symbols` icon.
    /// - Parameters:
    ///   - title: A string to used as the label’s title.
    ///   - symbol: The symbol representing an `SF Symbol` icon.
    ///   - action: The action for the button.
    public init<S: StringProtocol>(_ title: S, symbol: Symbol, action: @escaping () -> Void) {
        self.label  = Label(title, symbol: symbol)
        self.action = action
    }
    
    /// Creates a button with a label showing both a localizable title and a resource image icon.
    /// - Parameters:
    ///   - titleKey: A title generated from a localized string.
    ///   - name: The name of an image resource to lookup.
    ///   - action: The action for the button.
    public init(_ titleKey: LocalizedStringKey, image name: String, action: @escaping () -> Void) {
        self.label  = Label(titleKey, image: name)
        self.action = action
    }
    
    /// Creates a button with a label showing both a localizable title and a `SF Symbols` icon.
    /// - Parameters:
    ///   - titleKey: A title generated from a localized string.
    ///   - name: The name of an `SF Symbol` icon.
    ///   - action: The action for the button.
    public init(_ titleKey: LocalizedStringKey, systemImage name: String, action: @escaping () -> Void) {
        self.label  = Label(titleKey, systemImage: name)
        self.action = action
    }
    
    /// Creates a button with a label showing both a localizable title and a `SF Symbols` icon.
    /// - Parameters:
    ///   - titleKey: A title generated from a localized string.
    ///   - symbol: The symbol representing an `SF Symbol` icon.
    ///   - action: The action for the button.
    public init(_ titleKey: LocalizedStringKey, symbol: Symbol, action: @escaping () -> Void) {
        self.label  = Label(titleKey, symbol: symbol)
        self.action = action
    }
    
    /// The content and behavior of the view.
    public var body: some View {
        Button(action: action) {
            label
        }
    }
}
