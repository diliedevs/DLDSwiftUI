//
//  NavBarFontHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 04/05/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

#if os(iOS)
public extension UIFontDescriptor {
    static func withStyle(_ style: UIFont.TextStyle, weight: UIFont.Weight = .regular, design: SystemDesign = .default) -> UIFontDescriptor? {
        let base        = preferredFontDescriptor(withTextStyle: style)
        let weightTrait = [TraitKey.weight: weight]
        let desc        = base.addingAttributes([.traits: weightTrait])
        
        return desc.withDesign(design)
    }
}

public extension UIFont {
    static func inStyle(_ style: UIFont.TextStyle, weight: UIFont.Weight = .regular, design: UIFontDescriptor.SystemDesign = .default) -> UIFont {
        var font = preferredFont(forTextStyle: style)
        
        if let desc = UIFontDescriptor.withStyle(style, weight: weight, design: design) {
            font = UIFont(descriptor: desc, size: 0)
        }
        
        return font
    }
}
#endif

#if os(OSX)
public extension NSFontDescriptor {
    static func withStyle(_ style: NSFont.TextStyle, weight: NSFont.Weight = .regular, design: SystemDesign = .default) -> NSFontDescriptor? {
        let base        = preferredFontDescriptor(forTextStyle: style)
        let weightTrait = [TraitKey.weight: weight]
        let desc        = base.addingAttributes([.traits: weightTrait])
        
        return desc.withDesign(design)
    }
}

public extension NSFont {
    static func inStyle(_ style: NSFont.TextStyle, weight: NSFont.Weight = .regular, design: NSFontDescriptor.SystemDesign = .default) -> NSFont {
        var font = preferredFont(forTextStyle: style)
        
        if let desc = NSFontDescriptor.withStyle(style, weight: weight, design: design) {
            font = NSFont(descriptor: desc, size: 0) ?? font
        }
        
        return font
    }
}
#endif
