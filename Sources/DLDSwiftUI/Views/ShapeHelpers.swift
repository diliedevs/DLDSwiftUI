//
//  ShapeHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 30/10/2022.
//  Copyright © 2022 DiLieDevs. All rights reserved.
//

import SwiftUI

public extension Shape where Self == RoundedRectangle {
    /// Returns a rounded rectangle with a corner radius of 5.
    static var stadium: some Shape { RoundedRectangle(cornerRadius: 5) }
}

public extension InsettableShape where Self == RoundedRectangle {
    /// Returns a rounded rectangle with a corner radius of 5.
    static var stadium: some InsettableShape { RoundedRectangle(cornerRadius: 5) }
}

public extension Shape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 1) -> some View {
        self
            .stroke(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}

public extension InsettableShape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 1) -> some View {
        self
            .strokeBorder(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}
