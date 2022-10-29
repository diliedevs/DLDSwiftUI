//
//  Separator.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 06/10/2022.
//  Copyright © 2022 DiLieDevs. All rights reserved.
//

import SwiftUI

/// A visual (colored) divider that can be used to separate other content.
public struct Separator: View {
    var color: Color
    
    /// Creates a visual (colored) divider that can be used to separate other content.
    /// - Parameter color: The optional color for the divider.
    public init(in color: Color = .clear) {
        self.color = color
    }
    
    /// The content and behavior of the view.
    public var body: some View {
        Divider().background(color)
    }
}
