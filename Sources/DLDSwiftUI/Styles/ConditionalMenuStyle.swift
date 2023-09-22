//
//  ConditionalMenuStyle.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 09/04/2023.
//  Copyright © 2023 DiLieDevs. All rights reserved.
//

import SwiftUI

public extension View {
    @ViewBuilder func menuStyle<TS: MenuStyle, FS: MenuStyle>(if condition: Bool, trueStyle: TS, falseStyle: FS) -> some View {
        if condition {
            self.menuStyle(trueStyle)
        } else {
            self.menuStyle(falseStyle)
        }
    }
}

//extension ConditionalStyle: MenuStyle where TrueStyle: MenuStyle, FalseStyle: MenuStyle {
//    
//    public func makeBody(configuration: MenuStyleConfiguration) -> some View {
//        if condition {
//            trueStyle.makeBody(configuration: configuration)
//        } else {
//            falseStyle.makeBody(configuration: configuration)
//        }
//    }
//}

//public extension MenuStyle where Self == ConditionalStyle<any MenuStyle, any MenuStyle> {
//    
//    static func conditional<T: MenuStyle, F: MenuStyle>(if condition: Bool, then trueStyle: T, else falseStyle: F) -> ConditionalStyle<T, F> {
//        ConditionalStyle(condition: condition, trueStyle: trueStyle, falseStyle: falseStyle)
//    }
//}
