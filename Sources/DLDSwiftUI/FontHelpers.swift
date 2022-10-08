//
//  FontHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 06/10/2022.
//  Copyright © 2022 DiLieDevs. All rights reserved.
//

import SwiftUI

public extension Font {
    /// Gets a system font with the given text style and the rounded design.
    /// - Parameter style: The text style for the font.
    static func rounded(_ style: TextStyle = .body) -> Font {
        system(style, design: .rounded)
    }
    
    // Gets a system font with the given text style and the serif design.
    /// - Parameter style: The text style for the font.
    static func serif(_ style: TextStyle = .body) -> Font {
        system(style, design: .serif)
    }
    
    /// Adds italics to the font when this given condition is met.
    /// - Parameter apply: The condition to be met to apply italics.
    func italic(_ apply: Bool) -> Font {
        apply ? self.italic() : self
    }
}
