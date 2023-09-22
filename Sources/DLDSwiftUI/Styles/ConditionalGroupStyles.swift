//
//  ConditionalGroupStyles.swift
///  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 09/04/2023.
//  Copyright © 2023 DiLieDevs. All rights reserved.
//

import SwiftUI

// MARK: - Control Group Style
public extension View {
    @ViewBuilder func controlGroupStyle<TS: ControlGroupStyle, FS: ControlGroupStyle>(if condition: Bool, trueStyle: TS, falseStyle: FS) -> some View {
        if condition {
            self.controlGroupStyle(trueStyle)
        } else {
            self.controlGroupStyle(falseStyle)
        }
    }
}

//extension ConditionalStyle: ControlGroupStyle where TrueStyle: ControlGroupStyle, FalseStyle: ControlGroupStyle {
//    
//    public func makeBody(configuration: ControlGroupStyleConfiguration) -> some View {
//        if condition {
//            trueStyle.makeBody(configuration: configuration)
//        } else {
//            falseStyle.makeBody(configuration: configuration)
//        }
//    }
//}

//public extension ControlGroupStyle where Self == ConditionalStyle<any ControlGroupStyle, any ControlGroupStyle> {
//    
//    static func conditional<T: ControlGroupStyle, F: ControlGroupStyle>(if condition: Bool, then trueStyle: T, else falseStyle: F) -> ConditionalStyle<T, F> {
//        ConditionalStyle(condition: condition, trueStyle: trueStyle, falseStyle: falseStyle)
//    }
//}

// MARK: - Group Box Style
public extension View {
    @ViewBuilder func groupBoxStyle<TS: GroupBoxStyle, FS: GroupBoxStyle>(if condition: Bool, trueStyle: TS, falseStyle: FS) -> some View {
        if condition {
            self.groupBoxStyle(trueStyle)
        } else {
            self.groupBoxStyle(falseStyle)
        }
    }
}

//extension ConditionalStyle: GroupBoxStyle where TrueStyle: GroupBoxStyle, FalseStyle: GroupBoxStyle {
//    
//    public func makeBody(configuration: GroupBoxStyleConfiguration) -> some View {
//        if condition {
//            trueStyle.makeBody(configuration: configuration)
//        } else {
//            falseStyle.makeBody(configuration: configuration)
//        }
//    }
//}

//public extension GroupBoxStyle where Self == ConditionalStyle<any GroupBoxStyle, any GroupBoxStyle> {
//    
//    static func conditional<T: GroupBoxStyle, F: GroupBoxStyle>(if condition: Bool, then trueStyle: T, else falseStyle: F) -> ConditionalStyle<T, F> {
//        ConditionalStyle(condition: condition, trueStyle: trueStyle, falseStyle: falseStyle)
//    }
//}
