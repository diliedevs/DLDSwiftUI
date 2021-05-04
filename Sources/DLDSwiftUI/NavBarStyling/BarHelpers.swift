//
//  BarHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 04/05/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

#if os(iOS)
public extension UINavigationBar {
    static func style(with backgroundColor: UIColor, titleTraits: TextTraits, largeTitleTraits: TextTraits) {
        let style = UINavigationBarAppearance()
        style.configureWithTransparentBackground()
        style.backgroundColor          = backgroundColor
        style.titleTextAttributes      = titleTraits.asAttributes
        style.largeTitleTextAttributes = largeTitleTraits.asAttributes
        
        appearance().compactAppearance    = style
        appearance().standardAppearance   = style
        appearance().scrollEdgeAppearance = style
    }
    
    static func style(with backgroundColor: Color, opacity: CGFloat = 1, titleTraits: TextTraits, largeTitleTraits: TextTraits) {
        style(with: backgroundColor.uiColor(with: opacity), titleTraits: titleTraits, largeTitleTraits: largeTitleTraits)
    }
}

public extension UIToolbar {
    static func style(with backgroundColor: UIColor) {
        let style = UIToolbarAppearance()
        style.configureWithTransparentBackground()
        style.backgroundColor = backgroundColor
        
        appearance().compactAppearance  = style
        appearance().standardAppearance = style
    }
    
    static func style(with backgroundColor: Color, opacity: CGFloat = 1) {
        style(with: backgroundColor.uiColor(with: opacity))
    }
}
#endif
