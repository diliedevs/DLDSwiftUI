//
//  ConditionalLabelStyle.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 09/04/2023.
//  Copyright © 2023 DiLieDevs. All rights reserved.
//

import SwiftUI

public extension View {
    @ViewBuilder func labelStyle<TS: LabelStyle, FS: LabelStyle>(if condition: Bool, trueStyle: TS, falseStyle: FS) -> some View {
        if condition {
            self.labelStyle(trueStyle)
        } else {
            self.labelStyle(falseStyle)
        }
    }
}

//extension ConditionalStyle: LabelStyle where TrueStyle: LabelStyle, FalseStyle: LabelStyle {
//    
//    public func makeBody(configuration: LabelStyleConfiguration) -> some View {
//        if condition {
//            trueStyle.makeBody(configuration: configuration)
//        } else {
//            falseStyle.makeBody(configuration: configuration)
//        }
//    }
//}

//public extension LabelStyle where Self == ConditionalStyle<any LabelStyle, any LabelStyle> {
//    
//    static func conditional<T: LabelStyle, F: LabelStyle>(if condition: Bool, then trueStyle: T, else falseStyle: F) -> ConditionalStyle<T, F> {
//        ConditionalStyle(condition: condition, trueStyle: trueStyle, falseStyle: falseStyle)
//    }
//}
