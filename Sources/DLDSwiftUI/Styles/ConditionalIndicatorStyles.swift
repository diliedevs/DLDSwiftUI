//
//  ConditionalIndicatorStyles.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 09/04/2023.
//  Copyright © 2023 DiLieDevs. All rights reserved.
//

import SwiftUI

// MARK: - Gauge Style
@available(iOS 16.0, *)
extension ConditionalStyle: GaugeStyle where TrueStyle: GaugeStyle, FalseStyle: GaugeStyle {
    
    public func makeBody(configuration: GaugeStyleConfiguration) -> some View {
        if condition {
            trueStyle.makeBody(configuration: configuration)
        } else {
            falseStyle.makeBody(configuration: configuration)
        }
    }
}

@available(iOS 16.0, *)
public extension GaugeStyle where Self == ConditionalStyle<any GaugeStyle, any GaugeStyle> {
    
    static func conditional<T: GaugeStyle, F: GaugeStyle>(if condition: Bool, then trueStyle: T, else falseStyle: F) -> ConditionalStyle<T, F> {
        ConditionalStyle(condition: condition, trueStyle: trueStyle, falseStyle: falseStyle)
    }
}

// MARK: - ProgressView Style
extension ConditionalStyle: ProgressViewStyle where TrueStyle: ProgressViewStyle, FalseStyle: ProgressViewStyle {
    
    public func makeBody(configuration: ProgressViewStyleConfiguration) -> some View {
        if condition {
            trueStyle.makeBody(configuration: configuration)
        } else {
            falseStyle.makeBody(configuration: configuration)
        }
    }
}

public extension ProgressViewStyle where Self == ConditionalStyle<any ProgressViewStyle, any ProgressViewStyle> {
    
    static func conditional<T: ProgressViewStyle, F: ProgressViewStyle>(if condition: Bool, then trueStyle: T, else falseStyle: F) -> ConditionalStyle<T, F> {
        ConditionalStyle(condition: condition, trueStyle: trueStyle, falseStyle: falseStyle)
    }
}
