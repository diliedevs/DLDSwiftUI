//
//  ColorHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 06/10/2022.
//  Copyright © 2022 DiLieDevs. All rights reserved.
//

import SwiftUI
import DynamicColor

public extension Color {
    /// Return the system black color with an opacity of `0.2`.
    static let shadowBlack = Color.black.opacity(0.2)
    /// Return the system black color with an opacity of `0.5`.
    static let halfBlack   = Color.black.opacity(0.5)
    /// Return the system gray color with an opacity of `0.5`.
    static let halfGray    = Color.gray.opacity(0.5)
    /// Return the system white color with an opacity of `0.5`.
    static let halfWhite   = Color.white.opacity(0.5)
    
    /// Returns the receiving color with an opacity of `0.5`.
    var half         : Color { self.opacity(0.5) }
    /// Returns the receiving color with an opacity of `0.25`.
    var quarter      : Color { self.opacity(0.25) }
    /// Returns the receiving color with an opacity of `0.75`.
    var threeQuarter : Color { self.opacity(0.75) }
    
    /// Returns an array of the standard system colors.
    static var standardColors: [Color] {
        if #available(macOS 12.0, iOS 15.0, *) {
            return [.white, .black, .red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue, .indigo, .purple, .pink, .gray, .brown, .primary, .secondary, .accentColor]
        } else {
            return [.white, .black, .red, .orange, .yellow, .green, .blue, .purple, .pink, .gray, .primary, .secondary, .accentColor]
        }
    }
}

#if os(iOS)
public extension Color {
    /// Returns the `UIColor` for the `SwiftUI Color`.
    var uiColor: UIColor { UIColor(self) }
    
    /// Returns the color representation as a hexadecimal string, similar to this pattern `#f4003b`.
    var hexString: String { uiColor.toHexString() }
    /// Returns the color representation as a hexadecimal string without the hash `#` symbol, similar to this pattern `f4003b`.
    var noHashHex: String { hexString.replacingOccurrences(of: "#", with: "") }
    
    /// Returns the `UIColor` for the `SwiftUI Color` with the given opacity.
    /// - Parameter opacity: The amount of opacity to apply to the color.
    func uiColor(with opacity: CGFloat = 1) -> UIColor {
        if self == .clear    { return .clear }
        else if opacity == 1 { return uiColor }
        else                 { return uiColor.withAlphaComponent(opacity) }
    }
}
#endif

#if os(macOS)
public extension Color {
    /// Returns the `NSColor` for the `SwiftUI Color`.
    var nsColor: NSColor { NSColor(self) }
    
    /// Returns the color representation as a hexadecimal string, similar to this pattern `#f4003b`.
    var hexString: String { nsColor.toHexString() }
    /// Returns the color representation as a hexadecimal string without the hash `#` symbol, similar to this pattern `f4003b`.
    var noHashHex: String { hexString.replacingOccurrences(of: "#", with: "") }
    
    /// Returns the `NSColor` for the `SwiftUI Color` with the given opacity.
    /// - Parameter opacity: The amount of opacity to apply to the color.
    func nsColor(with opacity: CGFloat = 1) -> NSColor {
        if self == .clear    { return .clear }
        else if opacity == 1 { return nsColor }
        else                 { return nsColor.withAlphaComponent(opacity) }
    }
}
#endif
