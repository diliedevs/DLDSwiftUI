//
//  ConditionalToggleStyle.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 09/04/2023.
//  Copyright © 2023 DiLieDevs. All rights reserved.
//

import SwiftUI

extension ConditionalStyle: ToggleStyle where TrueStyle: ToggleStyle, FalseStyle: ToggleStyle {
    
    public func makeBody(configuration: ToggleStyleConfiguration) -> some View {
        if condition {
            trueStyle.makeBody(configuration: configuration)
        } else {
            falseStyle.makeBody(configuration: configuration)
        }
    }
}

public extension ToggleStyle where Self == ConditionalStyle<any ToggleStyle, any ToggleStyle> {
    
    static func conditional<T: ToggleStyle, F: ToggleStyle>(if condition: Bool, then trueStyle: T, else falseStyle: F) -> ConditionalStyle<T, F> {
        ConditionalStyle(condition: condition, trueStyle: trueStyle, falseStyle: falseStyle)
    }
}
