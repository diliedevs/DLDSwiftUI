//
//  File.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 21/11/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

public extension EdgeInsets {
    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
    init(horizontal: CGFloat) {
        self.init(horizontal: horizontal, vertical: 0)
    }
    init(vertical: CGFloat) {
        self.init(horizontal: 0, vertical: vertical)
    }
}
