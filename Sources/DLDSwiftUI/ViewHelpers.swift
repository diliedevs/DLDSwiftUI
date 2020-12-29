//
//  SwiftUIView.swift
//  
//
//  Created by Dionne Lie-Sam-Foek on 29/12/2020.
//

import SwiftUI

fileprivate extension BinaryFloatingPoint {
    var cgfloat: CGFloat { CGFloat(self) }
}

@available(OSX 11.0, iOS 14.0, *)
public extension View {
    /// Erases the view type to `AnyView`.
    func asAnyView() -> AnyView {
        AnyView(self)
    }
    
    /// Returns a view with it background set to the specifiied color of the given opacity.
    /// - Parameters:
    ///   - color: The color to fill the background with.
    ///   - opacity: A value between `0` (fully transparent) and `1` (fully opaque).
    func backgroundColor(_ color: Color, opacity: Double = 1) -> some View {
        self.background(color.opacity(opacity))
    }
    
    /// Sets the default font for text in the view and the color that the view uses for foreground elements.
    /// - Parameters:
    ///   - font: The default font to use in the view.
    ///   - color: The color to use in the view for foreground elements.
    func font(_ font: Font?, color: Color?) -> some View {
        self.font(font).foregroundColor(color)
    }
    
    /// Hides the large navigation bar title.
    func largeNavBarTitleHidden() -> some View {
        self.navigationBarTitle("", displayMode: .inline)
    }
    
    // MARK: - Frame
    
    /// Returns a view with the specified width and alignment.
    /// - Parameters:
    ///   - width: The fixed width for the resulting view.
    ///   - alignment: The alignment of this view inside the resulting frame. `alignment` applies if this view is smaller than the size given by the resulting frame.
    func width<T: BinaryFloatingPoint>(_ width: T, alignment: Alignment = .center) -> some View {
        self.frame(width: width.cgfloat, alignment: alignment)
    }
    /// Returns a view with the specified height and alignment.
    /// - Parameters:
    ///   - height: The fixed height for the resulting view.
    ///   - alignment: The alignment of this view inside the resulting frame. `alignment` applies if this view is smaller than the size given by the resulting frame.
    func height<T: BinaryFloatingPoint>(_ height: T, alignment: Alignment = .center) -> some View {
        self.frame(height: height.cgfloat, alignment: alignment)
    }
    /// Returns a view with the specified minimum width and alignment.
    /// - Parameters:
    ///   - width: The minimum width for the resulting view.
    ///   - alignment: The alignment of this view inside the resulting frame. `alignment` applies if this view is smaller than the size given by the resulting frame.
    func minWidth<T: BinaryFloatingPoint>(_ width: T, alignment: Alignment = .center) -> some View {
        self.frame(minWidth: width.cgfloat, alignment: alignment)
    }
    /// Returns a view with the specified height and alignment.
    /// - Parameters:
    ///   - height: The minimum height for the resulting view.
    ///   - alignment: The alignment of this view inside the resulting frame. `alignment` applies if this view is smaller than the size given by the resulting frame.
    func minHeight<T: BinaryFloatingPoint>(_ height: T, alignment: Alignment = .center) -> some View {
        self.frame(minHeight: height.cgfloat, alignment: alignment)
    }
    /// Returns a view with the specified maximum width and alignment.
    /// - Parameters:
    ///   - width: The maximum width for the resulting view.
    ///   - alignment: The alignment of this view inside the resulting frame. `alignment` applies if this view is smaller than the size given by the resulting frame.
    func maxWidth<T: BinaryFloatingPoint>(_ width: T, alignment: Alignment = .center) -> some View {
        self.frame(maxWidth: width.cgfloat, alignment: alignment)
    }
    /// Returns a view with the specified maximum height and alignment.
    /// - Parameters:
    ///   - height: The maximum height for the resulting view.
    ///   - alignment: The alignment of this view inside the resulting frame. `alignment` applies if this view is smaller than the size given by the resulting frame.
    func maxHeight<T: BinaryFloatingPoint>(_ height: T, alignment: Alignment = .center) -> some View {
        self.frame(maxHeight: height.cgfloat, alignment: alignment)
    }
    /// Returns a view with the specified equal width and height and alignment.
    /// - Parameters:
    ///   - size: The fixed width and height for the resulting view.
    ///   - alignment: The alignment of this view inside the resulting frame. `alignment` applies if this view is smaller than the size given by the resulting frame.
    func squared<T: BinaryFloatingPoint>(to size: T, alignment: Alignment = .center) -> some View {
        self.frame(width: size.cgfloat, height: size.cgfloat, alignment: alignment)
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
