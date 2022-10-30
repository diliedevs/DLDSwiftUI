//
//  ShapeHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 30/10/2022.
//  Copyright © 2022 DiLieDevs. All rights reserved.
//

import SwiftUI

extension Shape where Self == RoundedRectangle {
    /// Returns a rounded rectangle with a corner radius of 5.
    static var stadium: some Shape { RoundedRectangle(cornerRadius: 5) }
}

extension InsettableShape where Self == RoundedRectangle {
    /// Returns a rounded rectangle with a corner radius of 5.
    static var stadium: some InsettableShape { RoundedRectangle(cornerRadius: 5) }
}
