//
//  NumericTextField.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 04/05/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

public struct NumericTextField<Value: Numeric>: View {
    public let titleKey         : LocalizedStringKey
    @Binding public var value   : Value
    public let formatter        : NumberFormatter
    public var onEditingChanged : (Bool) -> Void = { _ in }
    public var onCommit         : () -> Void     = {}
    
    #if os(iOS)
    public var keyboardType: UIKeyboardType = .decimalPad
    #endif
    
    public init(titleKey: LocalizedStringKey, value: Binding<Value>, formatter: NumberFormatter, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) {
        self.titleKey         = titleKey
        self._value           = value
        self.formatter        = formatter
        self.onEditingChanged = onEditingChanged
        self.onCommit         = onCommit
    }
    
    #if os(iOS)
    public init(titleKey: LocalizedStringKey, value: Binding<Value>, formatter: NumberFormatter, keyboardType: UIKeyboardType = .decimalPad, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) {
        self.init(titleKey: titleKey, value: value, formatter: formatter, onEditingChanged: onEditingChanged, onCommit: onCommit)
        self.keyboardType = keyboardType
    }
    #endif
    
    public var body: some View {
        Group {
            #if os(iOS)
            TextField(titleKey, value: value, formatter: formatter, onEditingChanged: onEditingChanged, onCommit: onCommit)
                .keyboardType(keyboardType)
            #else
            TextField(titleKey, value: value, formatter: formatter, onEditingChanged: onEditingChanged, onCommit: onCommit)
            #endif
        }
    }
}

