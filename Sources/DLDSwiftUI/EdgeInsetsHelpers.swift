//
//  EdgeInsetsHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 06/10/2022.
//  Copyright © 2022 DiLieDevs. All rights reserved.
//

import SwiftUI

public extension EdgeInsets {
    /// Creates edge insets from the given horizontal and vertical values.
    /// - Parameters:
    ///   - horizontal: The amount to inset the leading and trailing edges.
    ///   - vertical: The amount to inset the top and bottom edges.
    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
    
    /// Creates edge insets from the given horizontal value and no vertical insets.
    /// - Parameters:
    ///   - horizontal: The amount to inset the leading and trailing edges.
    init(horizontal: CGFloat) {
        self.init(horizontal: horizontal, vertical: 0)
    }
    
    /// Creates edge insets from the given vertical values and no horizontal insets.
    /// - Parameters:
    ///   - vertical: The amount to inset the top and bottom edges.
    init(vertical: CGFloat) {
        self.init(horizontal: 0, vertical: vertical)
    }
    
    /// Returns edge insets with a value of `0` for all edges.
    static var zero: EdgeInsets {
        EdgeInsets(horizontal: 0, vertical: 0)
    }
}
