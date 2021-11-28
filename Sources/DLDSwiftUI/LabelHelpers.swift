//
//  LabelHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 30/12/2020.
//  Copyright © 2020 DiLieDevs. All rights reserved.
//

import SwiftUI

@available(macOS, obsoleted: 11.3, message: "Use the SwiftUI native TitleAndIconLabelStyle instead")
@available(iOS, obsoleted: 14.5, message: "Use the SwiftUI native TitleAndIconLabelStyle instead")
/// A label style that forces the display of both the icon and title of the label.
public struct FullLabelStyle: LabelStyle {
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
            configuration.title
        }
    }
}

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
    static var vertical: Self {
        .init()
    }
}

@available(macOS, obsoleted: 11.3, message: "Use .labelStyle(.style) notation instead")
@available(iOS, obsoleted: 14.5, message: "Use .labelStyle(.style) notation instead")
public extension View {
    /// Sets the default label style for labels within this view.
    func defaultLabel() -> some View {
        self.labelStyle(DefaultLabelStyle())
    }
    /// Sets the full label style (both the icon and the title) for labels within this view.
    func fullLabel() -> some View {
        Group {
            if #available(OSX 11.3, iOS 14.5, *) {
                self.labelStyle(TitleAndIconLabelStyle())
            } else {
                self.labelStyle(FullLabelStyle())
            }
        }
    }
    /// Sets the reverse label style (with the title before the icon) for labels within this view.
    func reverseLabel() -> some View {
        self.labelStyle(ReverseLabelStyle())
    }
    /// Sets the icon only label style for labels within this view.
     func iconOnlyLabel() -> some View {
        self.labelStyle(IconOnlyLabelStyle())
    }
    /// Sets the title only label style for labels within this view.
    func titleOnlyLabel() -> some View {
        self.labelStyle(TitleOnlyLabelStyle())
    }
}

