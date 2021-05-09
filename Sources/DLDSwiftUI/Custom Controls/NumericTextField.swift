//
//  NumericTextField.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 04/05/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

/// A text field for numeric values.
public struct NumericTextField<Value: Numeric>: View {
    let titleKey         : LocalizedStringKey
    @Binding var value   : Value
    let formatter        : NumberFormatter
    var onEditingChanged : (Bool) -> Void = { _ in }
    var onCommit         : () -> Void     = {}
    
    #if os(iOS)
    var keyboardType: UIKeyboardType = .decimalPad
    #endif
    
    /// Creates a text field for numeric values with a localized title.
    /// - Parameters:
    ///   - titleKey: The key for the localized title describing the text fields purpose.
    ///   - value: The numeric value to display and edit.
    ///   - formatter: The number formatter to use for conversion between the string and the value.
    ///   - onEditingChanged: The action to perform when the user begins editing the value and after the user finishes editing.
    ///   - onCommit: An action to perform when the user performs an action while the text field has focus.
    public init(_ titleKey: LocalizedStringKey, value: Binding<Value>, formatter: NumberFormatter, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) {
        self.titleKey         = titleKey
        self._value           = value
        self.formatter        = formatter
        self.onEditingChanged = onEditingChanged
        self.onCommit         = onCommit
    }
    
    #if os(iOS)
    /// Creates a text field for numeric values with a localized title.
    /// - Parameters:
    ///   - titleKey: The key for the localized title describing the text fields purpose.
    ///   - value: The numeric value to display and edit.
    ///   - formatter: The number formatter to use for conversion between the string and the value.
    ///   - keyboardType: One of the keyboard types defined in the `UIKeyboardType` enumeration.
    ///   - onEditingChanged: The action to perform when the user begins editing the value and after the user finishes editing.
    ///   - onCommit: An action to perform when the user performs an action while the text field has focus.
    public init(_ titleKey: LocalizedStringKey, value: Binding<Value>, formatter: NumberFormatter, keyboardType: UIKeyboardType = .decimalPad, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) {
        self.init(titleKey, value: value, formatter: formatter, onEditingChanged: onEditingChanged, onCommit: onCommit)
        self.keyboardType = keyboardType
    }
    #endif
    
    /// The content and behavior of the view.
    public var body: some View {
        Group {
            #if os(iOS)
            
            TextField(titleKey, value: $value, formatter: formatter, onEditingChanged: onEditingChanged, onCommit: onCommit)
                .keyboardType(keyboardType)
            
            #else
            
            TextField(titleKey, value: $value, formatter: formatter, onEditingChanged: onEditingChanged, onCommit: onCommit)
            
            #endif
        }
    }
}

