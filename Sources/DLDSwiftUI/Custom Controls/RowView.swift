//
//  RowView.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 04/05/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

public struct RowView<Prefix: View, Content: View>: View {
    let prefix: Prefix
    @ViewBuilder var content: () -> Content
    
    public init(prefix: Prefix, @ViewBuilder content: @escaping () -> Content) {
        self.prefix  = prefix
        self.content = content
    }
    
    public var body: some View {
        HStack {
            prefix
            Spacer()
            content()
        }
    }
}

public extension RowView where Prefix == Text, Content: View {
    init<S: StringProtocol>(_ title: S, content: @escaping () -> Content) {
        self.init(prefix: Text(title), content: content)
    }
    
    init(_ titleKey: LocalizedStringKey, content: @escaping () -> Content) {
        self.init(prefix: Text(titleKey), content: content)
    }
}

public extension RowView where Prefix == Label<Text, Image>, Content: View {
    init<S: StringProtocol>(_ title: S, image name: String, content: @escaping () -> Content) {
        self.init(prefix: Label(title, image: name), content: content)
    }
    
    init<S: StringProtocol>(_ title: S, systemImage name: String, content: @escaping () -> Content) {
        self.init(prefix: Label(title, systemImage: name), content: content)
    }
    
    init<S: StringProtocol>(_ title: S, symbol: Symbol, content: @escaping () -> Content) {
        self.init(prefix: Label(title, symbol: symbol), content: content)
    }
    
    init(_ titleKey: LocalizedStringKey, image name: String, content: @escaping () -> Content) {
        self.init(prefix: Label(titleKey, image: name), content: content)
    }
    
    init(_ titleKey: LocalizedStringKey, systemImage name: String, content: @escaping () -> Content) {
        self.init(prefix: Label(titleKey, systemImage: name), content: content)
    }
    
    init(_ titleKey: LocalizedStringKey, symbol: Symbol, content: @escaping () -> Content) {
        self.init(prefix: Label(titleKey, symbol: symbol), content: content)
    }
}
