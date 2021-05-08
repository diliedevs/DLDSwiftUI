//
//  ColorHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 02/05/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

public extension Color {
    static let shadowBlack = Color.black.opacity(0.2)
    static let halfBlack   = Color.black.opacity(0.5)
    static let halfGray    = Color.gray.opacity(0.5)
    static let halfWhite   = Color.white.opacity(0.5)
    
    
    #if os(iOS)
    static let systemBackground                 = Color(UIColor.systemBackground)
    static let secondarySystemBackground        = Color(UIColor.secondarySystemBackground)
    static let systemGroupedBackground          = Color(UIColor.systemGroupedBackground)
    static let secondarySystemGroupedBackground = Color(UIColor.secondarySystemGroupedBackground)
    
    var uiColor: UIColor { UIColor(self) }
    
    func uiColor(with opacity: CGFloat = 1) -> UIColor {
        if self == .clear    { return .clear }
        else if opacity == 1 { return uiColor }
        else                 { return uiColor.withAlphaComponent(opacity) }
    }
    #endif
    
    #if os(OSX)
    var nsColor: NSColor { NSColor(self) }
    
    func nsColor(with opacity: CGFloat = 1) -> NSColor {
        if self == .clear    { return .clear }
        else if opacity == 1 { return nsColor }
        else                 { return nsColor.withAlphaComponent(opacity) }
    }
    #endif
}
