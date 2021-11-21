//
//  ToolbarButton.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 04/05/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

public struct ToolbarButton<Content: View>: ToolbarContent {
    let presented : Bool
    let placement : ToolbarItemPlacement
    let action    : () -> Void
    @ViewBuilder let content: () -> Content
    
    public init(presented: Bool = true, at placement: ToolbarItemPlacement = .automatic, action: @escaping () -> Void, content: @escaping () -> Content) {
        self.presented = presented
        self.placement = placement
        self.action    = action
        self.content   = content
    }
    
    public var body: some ToolbarContent {
        ToolbarItem(placement: placement) {
            if presented {
                Button(action: action) {
                    content()
                }
            }
        }
    }
}

public extension ToolbarButton where Content == Text {
    init<S: StringProtocol>(_ title: S, presented: Bool = true, at placement: ToolbarItemPlacement = .automatic, action: @escaping () -> Void) {
        self.init(presented: presented, at: placement, action: action, content: { Text(title) })
    }
    
    init(_ titleKey: LocalizedStringKey, presented: Bool = true, at placement: ToolbarItemPlacement = .automatic, action: @escaping () -> Void) {
        self.init(presented: presented, at: placement, action: action, content: { Text(titleKey) })
    }
    
    static func cancel(_ titleKey: LocalizedStringKey = "Cancel", presented: Bool = true, action: @escaping () -> Void) -> ToolbarButton {
        ToolbarButton(titleKey, presented: presented, at: .cancellationAction, action: action)
    }
    
    static func confirm(_ titleKey: LocalizedStringKey, presented: Bool = true, action: @escaping () -> Void) -> ToolbarButton {
        ToolbarButton(titleKey, presented: presented, at: .confirmationAction, action: action)
    }
    
    static func add(_ titleKey: LocalizedStringKey = "Add", presented: Bool = true, at placement: ToolbarItemPlacement = .automatic, action: @escaping () -> Void) -> ToolbarButton {
        ToolbarButton(titleKey, presented: presented, at: placement, action: action)
    }
}

public extension ToolbarButton where Content == Label<Text, Image> {
    init<S: StringProtocol>(_ title: S, image name: String, presented: Bool = true, at placement: ToolbarItemPlacement = .automatic, action: @escaping () -> Void) {
        self.init(presented: presented, at: placement, action: action, content: { Label(title, image: name) })
    }
    
    init<S: StringProtocol>(_ title: S, systemImage name: String, presented: Bool = true, at placement: ToolbarItemPlacement = .automatic, action: @escaping () -> Void) {
        self.init(presented: presented, at: placement, action: action, content: { Label(title, systemImage: name) })
    }
    
    init<S: StringProtocol>(_ title: S, symbol: Symbol, presented: Bool = true, at placement: ToolbarItemPlacement = .automatic, action: @escaping () -> Void) {
        self.init(presented: presented, at: placement, action: action, content: { Label(title, systemImage: symbol.rawValue) })
    }
    
    init(_ titleKey: LocalizedStringKey, image name: String, presented: Bool = true, at placement: ToolbarItemPlacement = .automatic, action: @escaping () -> Void) {
        self.init(presented: presented, at: placement, action: action, content: { Label(titleKey, image: name) })
    }
    
    init(_ titleKey: LocalizedStringKey, systemImage name: String, presented: Bool = true, at placement: ToolbarItemPlacement = .automatic, action: @escaping () -> Void) {
        self.init(presented: presented, at: placement, action: action, content: { Label(titleKey, systemImage: name) })
    }
    
    init(_ titleKey: LocalizedStringKey, symbol: Symbol, presented: Bool = true, at placement: ToolbarItemPlacement = .automatic, action: @escaping () -> Void) {
        self.init(presented: presented, at: placement, action: action, content: { Label(titleKey, systemImage: symbol.rawValue) })
    }
    
    static func add(_ titleKey: LocalizedStringKey = "Add", symbol: Symbol = .plusCircle, presented: Bool = true, at placement: ToolbarItemPlacement = .automatic, action: @escaping () -> Void) -> ToolbarButton {
        ToolbarButton(titleKey, symbol: symbol, presented: presented, at: placement, action: action)
    }
}
