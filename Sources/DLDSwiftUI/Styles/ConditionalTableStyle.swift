//
//  ConditionalTableStyle.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 09/04/2023.
//  Copyright © 2023 DiLieDevs. All rights reserved.
//

import SwiftUI

@available(iOS 16.0, *)
public extension View {
    @ViewBuilder func tableStyle<TS: TableStyle, FS: TableStyle>(if condition: Bool, trueStyle: TS, falseStyle: FS) -> some View {
        if condition {
            self.tableStyle(trueStyle)
        } else {
            self.tableStyle(falseStyle)
        }
    }
}

//extension ConditionalStyle: TableStyle where TrueStyle: TableStyle, FalseStyle: TableStyle {
//    
//    public func makeBody(configuration: TableStyleConfiguration) -> some View {
//        if condition {
//            trueStyle.makeBody(configuration: configuration)
//        } else {
//            falseStyle.makeBody(configuration: configuration)
//        }
//    }
//}

//@available(iOS 16.0, *)
//public extension TableStyle where Self == ConditionalStyle<any TableStyle, any TableStyle> {
//    
//    static func conditional<T: TableStyle, F: TableStyle>(if condition: Bool, then trueStyle: T, else falseStyle: F) -> ConditionalStyle<T, F> {
//        ConditionalStyle(condition: condition, trueStyle: trueStyle, falseStyle: falseStyle)
//    }
//}
