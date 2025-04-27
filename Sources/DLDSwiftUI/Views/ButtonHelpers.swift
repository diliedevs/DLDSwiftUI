//
//  ButtonHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 06/10/2022.
//  Copyright © 2022 DiLieDevs. All rights reserved.
//

import SwiftUI
import SFSafeSymbols

@available(macOS 12.0, iOS 15.0.0, *)
public extension Button where Label == SwiftUI.Label<Text, Image> {
    /// Creates a button with a label showing both a title and a resource image icon.
    /// - Parameters:
    ///   - title: A string to be used as the label’s title.
    ///   - name: The name of an image resource to lookup.
    ///   - role: An optional semantic role that describes the button. A value of nil means that the button doesn’t have an assigned role.
    ///   - action: The action for the button.
    init<S: StringProtocol>(_ title: S, image imageName: String, role: ButtonRole? = nil, action: @escaping BasicAction) {
        self.init(role: role, action: action) {
            SwiftUI.Label(title, image: imageName)
        }
    }
    
    /// Creates a button with a label showing both a title and a `SF Symbols` icon.
    /// - Parameters:
    ///   - title: A string to be used as the label’s title.
    ///   - name: The name of an `SF Symbols` icon.
    ///   - role: An optional semantic role that describes the button. A value of nil means that the button doesn’t have an assigned role.
    ///   - action: The action for the button.
    init<S: StringProtocol>(_ title: S, systemImage imageName: String, role: ButtonRole? = nil, action: @escaping BasicAction) {
        self.init(role: role, action: action) {
            SwiftUI.Label(title, systemImage: imageName)
        }
    }
    
    /// Creates a button with a label showing both a localizable title and a resource image icon.
    /// - Parameters:
    ///   - titleKey: A title generated from a localized string.
    ///   - name: The name of an image resource to lookup.
    ///   - role: An optional semantic role that describes the button. A value of nil means that the button doesn’t have an assigned role.
    ///   - action: The action for the button.
    init(_ titleKey: LocalizedStringKey, image imageName: String, role: ButtonRole? = nil, action: @escaping BasicAction) {
        self.init(role: role, action: action) {
            SwiftUI.Label(titleKey, image: imageName)
        }
    }
    
    /// Creates a button with a label showing both a localizable title and a `SF Symbols` icon.
    /// - Parameters:
    ///   - titleKey: A title generated from a localized string.
    ///   - name: The name of an `SF Symbols` icon.
    ///   - role: An optional semantic role that describes the button. A value of nil means that the button doesn’t have an assigned role.
    ///   - action: The action for the button.
    init(_ titleKey: LocalizedStringKey, systemImage imageName: String, role: ButtonRole? = nil, action: @escaping BasicAction) {
        self.init(role: role, action: action) {
            SwiftUI.Label(titleKey, systemImage: imageName)
        }
    }
    
    /// Creates a button with a label showing both a title and a `SF Symbols` icon.
    /// - Parameters:
    ///   - title: A string to be used as the label’s title.
    ///   - symbol: A `Safe SF Symbols` icon.
    ///   - role: An optional semantic role that describes the button. A value of nil means that the button doesn’t have an assigned role.
    ///   - action: The action for the button.
    init<S: StringProtocol>(_ title: S, symbol: SFSymbol, role: ButtonRole? = nil, action: @escaping BasicAction) {
        self.init(role: role, action: action) {
            SwiftUI.Label(title, systemSymbol: symbol)
        }
    }
    
    /// Creates a button with a label showing both a localizable title and a `SF Symbols` icon.
    /// - Parameters:
    ///   - titleKey: A title generated from a localized string.
    ///   - symbol: A `Safe SF Symbols` icon.
    ///   - role: An optional semantic role that describes the button. A value of nil means that the button doesn’t have an assigned role.
    ///   - action: The action for the button.
    init(_ titleKey: LocalizedStringKey, symbol: SFSymbol, role: ButtonRole? = nil, action: @escaping BasicAction) {
        self.init(role: role, action: action) {
            SwiftUI.Label(titleKey, systemSymbol: symbol)
        }
    }
}

public extension Button where Label == Text {
    /// Creates a button with the given to action to cancel out of something.
    /// - Parameter action: The action to take when the button is pressed.
    static func cancel(action: @escaping BasicAction) -> Self {
        if #available(macOS 12.0, iOS 15.0.0, *) {
            return Button("Cancel", role: .cancel, action: action)
        } else {
            return Button("Cancel", action: action)
        }
    }
    
    /// Creates a button with the given to action to delete something.
    /// - Parameter action: The action to take when the button is pressed.
    static func delete(action: @escaping BasicAction) -> Self {
        if #available(macOS 12.0, iOS 15.0.0, *) {
            return Button("Delete", role: .destructive, action: action)
        } else {
            return Button("Delete", action: action)
        }
    }
}

public extension Button where Label == SwiftUI.Label<Text, Image> {
    /// Creates a button with a destructive role, a title of `Delete` and the `􀈑` symbol.
    /// - Parameter action: The action for the button.
    static func delete(action: @escaping BasicAction) -> Self {
        if #available(macOS 12.0, iOS 15.0.0, *) {
            return Button("Delete", systemImage: "trash", role: .destructive, action: action)
        } else {
            return Button("Delete", systemImage: "trash", action: action)
        }
    }
    
    /// Creates a button with a title of `Filter` and the `􀌈` symbol.
    /// - Parameter action: The action for the button.
    static func filter(action: @escaping BasicAction) -> Self {
        Button("Filter", systemImage: "line.3.horizontal.decrease.circle", action: action)
    }
    
    /// Creates a button with a title of `Sort` and the `􀁾` symbol.
    /// - Parameter action: The action for the button.
    static func sort(action: @escaping BasicAction) -> Self {
        Button("Sort", systemImage: "arrow.up.arrow.down.circle", action: action)
    }
    
    /// Creates a button with a title of `Edit` and the `􀈎` symbol.
    /// - Parameter action: The action for the button.
    static func edit(action: @escaping BasicAction) -> Self {
        Button("Edit", systemImage: "square.and.pencil", action: action)
    }
    
    /// Creates a button with a title of `Add` and the `􀁌` symbol.
    /// - Parameter action: The action for the button.
    static func add(action: @escaping BasicAction) -> Self {
        Button("Add", systemImage: "plus.circle", action: action)
    }
}

public extension View {
    /// Sets the style of the buttons within this view according to a specified condition.
    /// - Parameters:
    ///   - condition: The condition by which to decide which button style to apply to the view.
    ///   - trueStyle: The button style to apply when the given condition is true.
    ///   - falseStyle: The button style to apply when the given condition is false.
    @ViewBuilder func buttonStyle<ST: PrimitiveButtonStyle, SF: PrimitiveButtonStyle>(if condition: Bool, then trueStyle: ST, else falseStyle: SF) -> some View {
        if condition {
            self.buttonStyle(trueStyle)
        } else {
            self.buttonStyle(falseStyle)
        }
    }
}
