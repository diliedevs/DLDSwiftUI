//
//  FontHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 06/10/2022.
//  Copyright © 2022 DiLieDevs. All rights reserved.
//

import SwiftUI

public extension Font {
    /// Adds italics to the font when this given condition is met.
    /// - Parameter apply: The condition to be met to apply italics.
    func italic(_ apply: Bool) -> Font {
        apply ? self.italic() : self
    }
}
