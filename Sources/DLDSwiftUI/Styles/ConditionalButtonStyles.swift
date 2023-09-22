//
//  ConditionalButtonStyles.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 09/04/2023.
//  Copyright © 2023 DiLieDevs. All rights reserved.
//

import SwiftUI

// MARK: - Primitive Button Style
public extension View {
    @ViewBuilder func buttonStyle<TS: PrimitiveButtonStyle, FS: PrimitiveButtonStyle>(if condition: Bool, trueStyle: TS, falseStyle: FS) -> some View {
        if condition {
            self.buttonStyle(trueStyle)
        } else {
            self.buttonStyle(falseStyle)
        }
    }
}

//extension ConditionalStyle: PrimitiveButtonStyle where TrueStyle: PrimitiveButtonStyle, FalseStyle: PrimitiveButtonStyle {
//    
//    public func makeBody(configuration: PrimitiveButtonStyleConfiguration) -> some View {
//        if condition {
//            trueStyle.makeBody(configuration: configuration)
//        } else {
//            falseStyle.makeBody(configuration: configuration)
//        }
//    }
//}
//
//public extension PrimitiveButtonStyle {
//    
//    static func conditional<T: PrimitiveButtonStyle, F: PrimitiveButtonStyle>(if condition: Bool, then trueStyle: T, else falseStyle: F) -> ConditionalStyle<T, F> {
//        ConditionalStyle(condition: condition, trueStyle: trueStyle, falseStyle: falseStyle)
//    }
//}

// MARK: - Button Style
public extension View {
    @ViewBuilder func buttonStyle<TS: ButtonStyle, FS: ButtonStyle>(if condition: Bool, trueStyle: TS, falseStyle: FS) -> some View {
        if condition {
            self.buttonStyle(trueStyle)
        } else {
            self.buttonStyle(falseStyle)
        }
    }
}

//extension ConditionalStyle: ButtonStyle where TrueStyle: ButtonStyle, FalseStyle: ButtonStyle {
//    
//    public func makeBody(configuration: ButtonStyleConfiguration) -> some View {
//        if condition {
//            trueStyle.makeBody(configuration: configuration)
//        } else {
//            falseStyle.makeBody(configuration: configuration)
//        }
//    }
//}

//public extension ButtonStyle where Self == ConditionalStyle<any ButtonStyle, any ButtonStyle> {
//    
//    static func conditional<T: ButtonStyle, F: ButtonStyle>(if condition: Bool, then trueStyle: T, else falseStyle: F) -> ConditionalStyle<T, F> {
//        ConditionalStyle(condition: condition, trueStyle: trueStyle, falseStyle: falseStyle)
//    }
//}
