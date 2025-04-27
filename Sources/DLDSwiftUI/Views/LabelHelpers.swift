//
//  LabelHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 06/10/2022.
//  Copyright © 2022 DiLieDevs. All rights reserved.
//

import SwiftUI

/// A label style that displays the title before the icon of the label.
public struct ReverseLabelStyle: LabelStyle {
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

public extension LabelStyle where Self == ReverseLabelStyle {
    /// A label style that displays the title before the icon of the label.
    static var reverse: Self {
        .init()
    }
}

/// A label style that displays the icon above the title of the label.
public struct VerticalLabelStyle: LabelStyle {
    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
            configuration.title
        }
    }
}

public extension LabelStyle where Self == VerticalLabelStyle {
    /// A label style that displays the icon above the title of the label.
    static var vertical: Self {
        .init()
    }
}

public extension View {
    /// Sets the style of the labels within this view according to a specified condition.
    /// - Parameters:
    ///   - condition: The condition by which to decide which label style to apply to the view.
    ///   - trueStyle: The label style to apply when the given condition is true.
    ///   - falseStyle: The label style to apply when the given condition is false.
    @ViewBuilder func labelStyle<ST: LabelStyle, SF: LabelStyle>(if condition: Bool, then trueStyle: ST, else falseStyle: SF) -> some View {
        if condition {
            self.labelStyle(trueStyle)
        } else {
            self.labelStyle(falseStyle)
        }
    }
}
