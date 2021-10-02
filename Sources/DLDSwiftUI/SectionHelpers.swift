//
//  SectionHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 02/05/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

public extension Section where Parent == Text, Content: View, Footer == EmptyView {
    
    @available(macOS, obsoleted: 12, message: "SwiftUI now has this same initializer.")
    @available(iOS, obsoleted: 15, message: "SwiftUI now has this same initializer.")
    init<S: StringProtocol>(_ title: S, @ViewBuilder content: () -> Content) {
        self.init(header: Text(title), content: content)
    }
    
    @available(macOS, obsoleted: 12, message: "SwiftUI now has this same initializer.")
    @available(iOS, obsoleted: 15, message: "SwiftUI now has this same initializer.")
    init(_ titleKey: LocalizedStringKey, @ViewBuilder content: () -> Content) {
        self.init(header: Text(titleKey), content: content)
    }
}
