//
//  SectionHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 02/05/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

public extension Section where Parent == Text, Content: View, Footer == EmptyView {
    init<S: StringProtocol>(_ title: S, @ViewBuilder content: () -> Content) {
        self.init(header: Text(title), content: content)
    }
    init(_ titleKey: LocalizedStringKey, @ViewBuilder content: () -> Content) {
        self.init(header: Text(titleKey), content: content)
    }
}