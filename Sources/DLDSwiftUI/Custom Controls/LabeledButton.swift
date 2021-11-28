//
//  LabeledButton.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 04/05/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

/// A `Button` view with a `Label` showing both a localizable title and a `SF Symbols` icon.
public struct LabeledButton: View {
    let label: Label<Text, Image>
    let action : BasicAction
    
    /// Creates a button with a label showing both a localizable title and a resource image icon.
    /// - Parameters:
    ///   - title: A string to used as the label’s title.
    ///   - name: The name of an image resource to lookup.
    ///   - action: The action for the button.
    public init<S: StringProtocol>(_ title: S, image name: String, action: @escaping BasicAction) {
        self.label  = Label(title, image: name)
        self.action = action
    }
    
    /// Creates a button with a label showing both a localizable title and a `SF Symbols` icon.
    /// - Parameters:
    ///   - title: A string to used as the label’s title.
    ///   - name: The name of an `SF Symbol` icon.
    ///   - action: The action for the button.
    public init<S: StringProtocol>(_ title: S, systemImage name: String, action: @escaping BasicAction) {
        self.label  = Label(title, systemImage: name)
        self.action = action
    }
    
    /// Creates a button with a label showing both a localizable title and a `SF Symbols` icon.
    /// - Parameters:
    ///   - title: A string to used as the label’s title.
    ///   - symbol: The symbol representing an `SF Symbol` icon.
    ///   - action: The action for the button.
    public init<S: StringProtocol>(_ title: S, symbol: Symbol, action: @escaping BasicAction) {
        self.label  = Label(title, symbol: symbol)
        self.action = action
    }
    
    /// Creates a button with a label showing both a localizable title and a resource image icon.
    /// - Parameters:
    ///   - titleKey: A title generated from a localized string.
    ///   - name: The name of an image resource to lookup.
    ///   - action: The action for the button.
    public init(_ titleKey: LocalizedStringKey, image name: String, action: @escaping BasicAction) {
        self.label  = Label(titleKey, image: name)
        self.action = action
    }
    
    /// Creates a button with a label showing both a localizable title and a `SF Symbols` icon.
    /// - Parameters:
    ///   - titleKey: A title generated from a localized string.
    ///   - name: The name of an `SF Symbol` icon.
    ///   - action: The action for the button.
    public init(_ titleKey: LocalizedStringKey, systemImage name: String, action: @escaping BasicAction) {
        self.label  = Label(titleKey, systemImage: name)
        self.action = action
    }
    
    /// Creates a button with a label showing both a localizable title and a `SF Symbols` icon.
    /// - Parameters:
    ///   - titleKey: A title generated from a localized string.
    ///   - symbol: The symbol representing an `SF Symbol` icon.
    ///   - action: The action for the button.
    public init(_ titleKey: LocalizedStringKey, symbol: Symbol, action: @escaping BasicAction) {
        self.label  = Label(titleKey, symbol: symbol)
        self.action = action
    }
    
    /// Creates a button with the `Filter` title and `􀌈` symbol.
    /// - Parameter action: The action for the button.
    public static func filter(action: @escaping BasicAction) -> Self {
        LabeledButton("Filter", symbol: .line3HorizontalDecreaseCircle, action: action)
    }
    /// Creates a button with the `Sort` title and `􀁾` symbol.
    /// - Parameter action: The action for the button.
    public static func sort(action: @escaping BasicAction) -> Self {
        LabeledButton("Sort", symbol: .arrowUpArrowDownCircle, action: action)
    }
    /// Creates a button with the `Edit` title and `􀈎` symbol.
    /// - Parameter action: The action for the button.
    public static func edit(action: @escaping BasicAction) -> Self {
        LabeledButton("Edit", symbol: .squareAndPencil, action: action)
    }
    /// Creates a button with the `Add` title and `􀁌` symbol.
    /// - Parameter action: The action for the button.
    public static func add(action: @escaping BasicAction) -> Self {
        LabeledButton("Add", symbol: .plusCircle, action: action)
    }
    
    /// The content and behavior of the view.
    public var body: some View {
        Button(action: action) {
            label
        }
    }
}

@available(macOS 12.0, iOS 15.0.0, *)
public struct EasyButtonStyle<BS: PrimitiveButtonStyle, LS: LabelStyle>: ViewModifier {
    public var buttonStyle : BS
    public var labelStyle  : LS
    public var imageScale  : Image.Scale = .medium
    public var tint        : Color?      = nil
    
    public func body(content: Content) -> some View {
        content
            .imageScale(imageScale)
            .labelStyle(labelStyle)
            .buttonStyle(buttonStyle)
            .tint(tint)
    }
}

@available(macOS 12.0, iOS 15.0.0, *)
public extension View {
    func easyButtonStyle<BS: PrimitiveButtonStyle, LS: LabelStyle>(buttonStyle: BS, labelStyle: LS, imageScale: Image.Scale = .medium, tint: Color? = nil) -> some View {
        self.modifier(EasyButtonStyle(buttonStyle: buttonStyle, labelStyle: labelStyle, imageScale: imageScale, tint: tint))
    }
    func easyButtonStyle<BS: PrimitiveButtonStyle>(buttonStyle: BS, imageScale: Image.Scale = .medium, tint: Color? = nil) -> some View {
        self.modifier(EasyButtonStyle(buttonStyle: buttonStyle, labelStyle: .automatic, imageScale: imageScale, tint: tint))
    }
    func easyButtonStyle<LS: LabelStyle>(labelStyle: LS, imageScale: Image.Scale = .medium, tint: Color? = nil) -> some View {
        self.modifier(EasyButtonStyle(buttonStyle: .automatic, labelStyle: labelStyle, imageScale: imageScale, tint: tint))
    }
    func easyButtonStyle(imageScale: Image.Scale = .medium, tint: Color? = nil) -> some View {
        self.modifier(EasyButtonStyle(buttonStyle: .automatic, labelStyle: .automatic, imageScale: imageScale, tint: tint))
    }
}
