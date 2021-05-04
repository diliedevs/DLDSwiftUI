//
//  TextTraits.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 04/05/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

public struct TextTraits {
    #if os(iOS)
    public let font : UIFont
    public let color: UIColor
    
    public init(font: UIFont, color: UIColor?) {
        self.font  = font
        self.color = color ?? .label
    }
    #endif
    
    #if os(OSX)
    public let font : NSFont
    public let color: NSColor
    
    public init(font: NSFont, color: NSColor?) {
        self.font  = font
        self.color = color ?? .labelColor
    }
    #endif
    
    public var asAttributes: [NSAttributedString.Key: Any] {
        [.font: font, .foregroundColor: color]
    }    
}