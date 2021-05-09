//
//  AlertHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 29/12/2020.
//  Copyright © 2020 DiLieDevs. All rights reserved.
//

import SwiftUI

public extension Alert {
    /// A struct that holds the localizable title and message for an `Alert` and is identifiable.
    struct TitleMessage: Identifiable {
        /// The unique identifier for the `TitleMessage`.
        public let id = UUID()
        /// The title as a `LocalizedStringKey`
        public let title : LocalizedStringKey
        /// The message as a `LocalizedStringKey`
        public let message : LocalizedStringKey
        
        /// Creates a `TitleMessage` with the given localizable title and message.
        /// - Parameters:
        ///   - titleKey: The key for the localized title.
        ///   - message: The message as a `LocalizedStringKey`.
        public init(_ titleKey: LocalizedStringKey, message: LocalizedStringKey) {
            self.title   = titleKey
            self.message = message
        }
    }
    
    /// Creates an alert with the given `TitleMessage` and two buttons.
    /// - Parameters:
    ///   - titleMsg: The `TitleMessage` holding the localizable title and message for the alert.
    ///   - primaryButton: The primary alert button.
    ///   - secondaryButton: The secondary alert button.
    init(titleMsg: TitleMessage, primaryButton: Alert.Button, secondaryButton: Alert.Button) {
        self.init(title: Text(titleMsg.title),
                  message: Text(titleMsg.message),
                  primaryButton: primaryButton,
                  secondaryButton: secondaryButton
        )
    }
    
    /// Creates an alert with the given `TitleMessage` and a single dismiss button.
    /// - Parameters:
    ///   - titleMsg: The `TitleMessage` holding the localizable title and message for the alert.
    ///   - dismissButton: The alert button to dismiss the alert.
    init(titleMsg: TitleMessage, dismissButton: Alert.Button? = nil) {
        self.init(title: Text(titleMsg.title), message: Text(titleMsg.message), dismissButton: dismissButton)
    }
}

public extension Alert.Button {
    /// Creates an alert button with the default style and a localizable title in a `Text` view.
    /// - Parameters:
    ///   - title: The title for the button.
    ///   - action: The action for the button.
    static func basic<S: StringProtocol>(_ title: S, action: (() -> Void)? = {}) -> Alert.Button {
        Self.default(Text(title), action: action)
    }
    
    /// Creates an alert button with the default style and a localizable title.
    /// - Parameters:
    ///   - title: The title for the button. The default is `OK`.
    ///   - action: The action for the button.
    static func ok<S: StringProtocol>(_ title: S = "OK", action: (() -> Void)? = {}) -> Alert.Button {
        basic(title, action: action)
    }
    
    /// Creates an alert button in a style that indicates the destruction of some data and a localizable title in a `Text` view.
    /// - Parameters:
    ///   - titleKey: The key for the localized title for the button.
    ///   - action: The action for the button.
    static func destructive<S: StringProtocol>(_ title: S, action: (() -> Void)? = {}) -> Alert.Button {
        destructive(Text(title), action: action)
    }
    
    /// Creates an alert button with the default style and a localizable title in a `Text` view.
    /// - Parameters:
    ///   - titleKey: The key for the localized title for the button.
    ///   - action: The action for the button.
    static func basic(_ titleKey: LocalizedStringKey, action: (() -> Void)? = {}) -> Alert.Button {
        Self.default(Text(titleKey), action: action)
    }
   
    /// Creates an alert button with the default style and a localizable title.
    /// - Parameters:
    ///   - titleKey: The key for the localized title for the button. The default is `ok`.
    ///   - action: The action for the button.
    static func ok(_ titleKey: LocalizedStringKey = "ok", action: (() -> Void)? = {}) -> Alert.Button {
        basic(titleKey, action: action)
    }
    
    /// Creates an alert button in a style that indicates the destruction of some data and a localizable title in a `Text` view.
    /// - Parameters:
    ///   - titleKey: The key for the localized title for the button.
    ///   - action: The action for the button.
    static func destructive(_ titleKey: LocalizedStringKey, action: (() -> Void)? = {}) -> Alert.Button {
        destructive(Text(titleKey), action: action)
    }
}
