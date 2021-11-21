//
//  LabeledRoleButton.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 28/10/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//  

import SwiftUI

/// A `Button` view with a `Label` showing both a localizable title and a `SF Symbols` icon.
@available(macOS 12.0.0, iOS 15.0.0, *)
public struct LabeledRoleButton: View {
    let label: Label<Text, Image>
    let role: ButtonRole?
    let action : () -> Void
    
    /// Creates a button with a label showing both a localizable title and a resource image icon.
    /// - Parameters:
    ///   - title: A string to used as the label’s title.
    ///   - name: The name of an image resource to lookup.
    ///   - role: An optional semantic role that describes the button. A value of nil means that the button doesn’t have an assigned role.
    ///   - action: The action for the button.
    public init<S: StringProtocol>(_ title: S, image name: String, role: ButtonRole?, action: @escaping () -> Void) {
        self.label  = Label(title, image: name)
        self.role   = role
        self.action = action
    }
    
    /// Creates a button with a label showing both a localizable title and a `SF Symbols` icon.
    /// - Parameters:
    ///   - title: A string to used as the label’s title.
    ///   - name: The name of an `SF Symbol` icon.
    ///   - role: An optional semantic role that describes the button. A value of nil means that the button doesn’t have an assigned role.
    ///   - action: The action for the button.
    public init<S: StringProtocol>(_ title: S, systemImage name: String, role: ButtonRole?, action: @escaping () -> Void) {
        self.label  = Label(title, systemImage: name)
        self.role   = role
        self.action = action
    }
    
    /// Creates a button with a label showing both a localizable title and a `SF Symbols` icon.
    /// - Parameters:
    ///   - title: A string to used as the label’s title.
    ///   - symbol: The symbol representing an `SF Symbol` icon.
    ///   - role: An optional semantic role that describes the button. A value of nil means that the button doesn’t have an assigned role.
    ///   - action: The action for the button.
    public init<S: StringProtocol>(_ title: S, symbol: Symbol, role: ButtonRole?, action: @escaping () -> Void) {
        self.label  = Label(title, symbol: symbol)
        self.role   = role
        self.action = action
    }
    
    /// Creates a button with a label showing both a localizable title and a resource image icon.
    /// - Parameters:
    ///   - titleKey: A title generated from a localized string.
    ///   - name: The name of an image resource to lookup.
    ///   - role: An optional semantic role that describes the button. A value of nil means that the button doesn’t have an assigned role.
    ///   - action: The action for the button.
    public init(_ titleKey: LocalizedStringKey, image name: String, role: ButtonRole?, action: @escaping () -> Void) {
        self.label  = Label(titleKey, image: name)
        self.role   = role
        self.action = action
    }
    
    /// Creates a button with a label showing both a localizable title and a `SF Symbols` icon.
    /// - Parameters:
    ///   - titleKey: A title generated from a localized string.
    ///   - name: The name of an `SF Symbol` icon.
    ///   - role: An optional semantic role that describes the button. A value of nil means that the button doesn’t have an assigned role.
    ///   - action: The action for the button.
    public init(_ titleKey: LocalizedStringKey, systemImage name: String, role: ButtonRole?, action: @escaping () -> Void) {
        self.label  = Label(titleKey, systemImage: name)
        self.role   = role
        self.action = action
    }
    
    /// Creates a button with a label showing both a localizable title and a `SF Symbols` icon.
    /// - Parameters:
    ///   - titleKey: A title generated from a localized string.
    ///   - symbol: The symbol representing an `SF Symbol` icon.
    ///   - role: An optional semantic role that describes the button. A value of nil means that the button doesn’t have an assigned role.
    ///   - action: The action for the button.
    public init(_ titleKey: LocalizedStringKey, symbol: Symbol, role: ButtonRole?, action: @escaping () -> Void) {
        self.label  = Label(titleKey, symbol: symbol)
        self.role   = role
        self.action = action
    }
    
    /// Creates a button with a destructive role, a title of `Delete` and the `􀈑` symbol.
    /// - Parameter action: The action for the button.
    public static func delete(action: @escaping () -> Void) -> Self {
        LabeledRoleButton("Delete", symbol: .trash, role: .destructive, action: action)
    }
    
    /// The content and behavior of the view.
    public var body: some View {
        Button(role: role, action: action) {
            label
        }
    }
}
