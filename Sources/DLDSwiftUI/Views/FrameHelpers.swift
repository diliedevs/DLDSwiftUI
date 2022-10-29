//
//  FrameHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 06/10/2022.
//  Copyright © 2022 DiLieDevs. All rights reserved.
//

import SwiftUI

public extension View {
    /// Returns a view with the specified width and alignment.
    /// - Parameters:
    ///   - width: The fixed width for the resulting view.
    ///   - alignment: The alignment of this view inside the resulting frame. `alignment` applies if this view is smaller than the size given by the resulting frame.
    func width(_ width: CGFloat, alignment: Alignment = .center) -> some View {
        self.frame(width: width, alignment: alignment)
    }
    
    /// Returns a view with the specified height and alignment.
    /// - Parameters:
    ///   - height: The fixed height for the resulting view.
    ///   - alignment: The alignment of this view inside the resulting frame. `alignment` applies if this view is smaller than the size given by the resulting frame.
    func height(_ height: CGFloat, alignment: Alignment = .center) -> some View {
        self.frame(height: height, alignment: alignment)
    }
    
    /// Returns a view with the specified minimum width and alignment.
    /// - Parameters:
    ///   - width: The minimum width for the resulting view.
    ///   - alignment: The alignment of this view inside the resulting frame. `alignment` applies if this view is smaller than the size given by the resulting frame.
    func minWidth(_ minWidth: CGFloat, alignment: Alignment = .center) -> some View {
        self.frame(minWidth: minWidth, alignment: alignment)
    }
    
    /// Returns a view with the specified height and alignment.
    /// - Parameters:
    ///   - height: The minimum height for the resulting view.
    ///   - alignment: The alignment of this view inside the resulting frame. `alignment` applies if this view is smaller than the size given by the resulting frame.
    func minHeight(_ minHeight: CGFloat, alignment: Alignment = .center) -> some View {
        self.frame(minHeight: minHeight, alignment: alignment)
    }
    
    /// Returns a view with the specified maximum width and alignment.
    /// - Parameters:
    ///   - width: The maximum width for the resulting view.
    ///   - alignment: The alignment of this view inside the resulting frame. `alignment` applies if this view is smaller than the size given by the resulting frame.
    func maxWidth(_ maxWidth: CGFloat, alignment: Alignment = .center) -> some View {
        self.frame(maxWidth: maxWidth, alignment: alignment)
    }
    
    /// Returns a view with the specified maximum height and alignment.
    /// - Parameters:
    ///   - height: The maximum height for the resulting view.
    ///   - alignment: The alignment of this view inside the resulting frame. `alignment` applies if this view is smaller than the size given by the resulting frame.
    func maxHeight(_ maxHeight: CGFloat, alignment: Alignment = .center) -> some View {
        self.frame(maxHeight: maxHeight, alignment: alignment)
    }
    
    /// Returns a view with the specified equal width and height and alignment.
    /// - Parameters:
    ///   - size: The fixed width and height for the resulting view.
    ///   - alignment: The alignment of this view inside the resulting frame. `alignment` applies if this view is smaller than the size given by the resulting frame.
    func squared(to size: CGFloat, alignment: Alignment = .center) -> some View {
        self.frame(width: size, height: size, alignment: alignment)
    }
    
    /// Returns a view that will take all available horizontal space with the specified alignment.
    /// - Parameter alignment: The alignment of this view inside the resulting frame. `alignment` applies if this view is smaller than the size given by the resulting frame.
    func fullWidth(alignment: Alignment = .center) -> some View {
        self.frame(maxWidth: .infinity, alignment: alignment)
    }
    
    /// Returns a view that will take all available vertical space with the specified alignment.
    /// - Parameter alignment: The alignment of this view inside the resulting frame. `alignment` applies if this view is smaller than the size given by the resulting frame.
    func fullHeight(alignment: Alignment = .center) -> some View {
        self.frame(maxHeight: .infinity, alignment: alignment)
    }
    
    /// Returns a view that will take all available horizontal and vertical space with the specified alignment.
    /// - Parameter alignment: The alignment of this view inside the resulting frame. `alignment` applies if this view is smaller than the size given by the resulting frame.
    func fullFrame(alignment: Alignment = .center) -> some View {
        self.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }
}
