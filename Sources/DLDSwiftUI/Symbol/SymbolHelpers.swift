//
//  SymbolHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 04/05/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

public extension Image {
    init(symbol: Symbol) {
        self.init(systemName: symbol.rawValue)
    }
}

public extension Label where Title == Text, Icon == Image {
    init<S: StringProtocol>(_ title: S, symbol: Symbol) {
        self.init(title, systemImage: symbol.rawValue)
    }
    
    init(_ titleKey: LocalizedStringKey, symbol: Symbol) {
        self.init(titleKey, systemImage: symbol.rawValue)
    }
}

public extension Section where Parent == Label<Text, Image>, Content: View, Footer == EmptyView {
    init<S: StringProtocol>(_ title: S, symbol: Symbol, @ViewBuilder content: () -> Content) {
        self.init(header: Label(title, symbol: symbol), content: content)
    }
    init(_ titleKey: LocalizedStringKey, symbol: Symbol, @ViewBuilder content: () -> Content) {
        self.init(header: Label(titleKey, symbol: symbol), content: content)
    }
}

public extension ToolbarButton {
    init(placement: ToolbarItemPlacement = .automatic, title: LocalizedStringKey, symbol: Symbol? = nil, presented: Bool = true, action: @escaping () -> Void) {
        self.init(placement: placement, title: title, systemImage: symbol?.rawValue, presented: presented, action: action)
    }
}
