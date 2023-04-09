//
//  ConditionalButtonStyles.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 09/04/2023.
//  Copyright © 2023 DiLieDevs. All rights reserved.
//

import SwiftUI

// MARK: - Primitive Button Style
extension ConditionalStyle: PrimitiveButtonStyle where TrueStyle: PrimitiveButtonStyle, FalseStyle: PrimitiveButtonStyle {
    
    public func makeBody(configuration: PrimitiveButtonStyleConfiguration) -> some View {
        if condition {
            trueStyle.makeBody(configuration: configuration)
        } else {
            falseStyle.makeBody(configuration: configuration)
        }
    }
}

public extension PrimitiveButtonStyle where Self == ConditionalStyle<any PrimitiveButtonStyle, any PrimitiveButtonStyle> {
    
    static func conditional<T: PrimitiveButtonStyle, F: PrimitiveButtonStyle>(if condition: Bool, then trueStyle: T, else falseStyle: F) -> ConditionalStyle<T, F> {
        ConditionalStyle(condition: condition, trueStyle: trueStyle, falseStyle: falseStyle)
    }
}

// MARK: - Button Style
extension ConditionalStyle: ButtonStyle where TrueStyle: ButtonStyle, FalseStyle: ButtonStyle {
    
    public func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        if condition {
            trueStyle.makeBody(configuration: configuration)
        } else {
            falseStyle.makeBody(configuration: configuration)
        }
    }
}

public extension ButtonStyle where Self == ConditionalStyle<any ButtonStyle, any ButtonStyle> {
    
    static func conditional<T: ButtonStyle, F: ButtonStyle>(if condition: Bool, then trueStyle: T, else falseStyle: F) -> ConditionalStyle<T, F> {
        ConditionalStyle(condition: condition, trueStyle: trueStyle, falseStyle: falseStyle)
    }
}
