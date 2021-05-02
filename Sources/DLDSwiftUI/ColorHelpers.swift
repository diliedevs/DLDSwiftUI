//
//  NewHelper.swift
//  
//
//  Created by Dionne Lie-Sam-Foek on 02/05/2021.
//

import SwiftUI

public extension Color {
    
    #if os(iOS)
    static let systemBackground                 = Color(UIColor.systemBackground)
    static let secondarySystemBackground        = Color(UIColor.secondarySystemBackground)
    static let systemGroupedBackground          = Color(UIColor.systemGroupedBackground)
    static let secondarySystemGroupedBackground = Color(UIColor.secondarySystemGroupedBackground)
    #endif
    
    static let shadowBlack = Color.black.opacity(0.2)
    static let halfBlack   = Color.black.opacity(0.5)
    static let halfGray    = Color.gray.opacity(0.5)
    static let halfWhite   = Color.white.opacity(0.5)
}
