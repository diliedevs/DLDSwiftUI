//
//  SwiftUIView.swift
//  
//
//  Created by Dionne Lie-Sam-Foek on 30/12/2020.
//

import SwiftUI

/// A label style that forces the display of both the icon and title of the label.
public struct FullLabelStyle: LabelStyle {
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
            configuration.title
        }
    }
}

public extension View {
    /// Sets the default label style for labels within this view.
    func defaultLabel() -> some View {
        self.labelStyle(DefaultLabelStyle())
    }
    /// Sets the full label style (both the icon and the title) for labels within this view.
    func fullLabel() -> some View {
        self.labelStyle(FullLabelStyle())
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

/// A `Button` view with a `Label` showing both a localizable title and a `SF Symbols` icon.
public struct LabeledButton: View {
    /// The localizable title for the button.
    public let title : LocalizedStringKey
    /// The name of the `SF Symbols` system image for the button.
    public let systemImage : String
    /// The action for the button.
    public let action : () -> Void
    
    /// Creates a button with a label showing both a localizable title and a `SF Symbols` icon.
    /// - Parameters:
    ///   - title: The title for the button as a `LocalizedStringKey`.
    ///   - systemImage: The name of the `SF Symbols` icon.
    ///   - action: The action for the button.
    public init(_ title: LocalizedStringKey, systemImage: String, action: @escaping () -> Void) {
        self.title        = title
        self.systemImage  = systemImage
        self.action       = action
    }
    
    public var body: some View {
        Button(action: action) {
            Label(title, systemImage: systemImage)
        }
    }
}
