//
//  ImageHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 06/10/2022.
//  Copyright © 2022 DiLieDevs. All rights reserved.
//

import SwiftUI

public extension Image {
    /// Returns the image configured to be resizable with the specified insets and resizing mode and scaled to fit its parent.
    /// - Parameters:
    ///   - capInsets: The amount the edges should be inset, set to no specific amount by default.
    ///   - resizingMode: The mode of resizing, set to `stretch` by default.
    func resizedToFit(capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> some View {
        self.resizable(capInsets: capInsets, resizingMode: resizingMode)
            .scaledToFit()
    }
    /// Returns the image configured to be resizable with the specified insets and resizing mode and scaled to fit in fa rame of the specified width and alignment.
    /// - Parameters:
    ///   - width: The width of the frame containing the image.
    ///   - alignment: The alignment of the frame containing the image.
    ///   - capInsets: The amount the edges should be inset, set to no specific amount by default.
    ///   - resizingMode: The mode of resizing, set to `stretch` by default.
    func resizedToFit(width: CGFloat, alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> some View {
        self.resizedToFit(capInsets: capInsets, resizingMode: resizingMode)
            .frame(width: width, alignment: alignment)
    }
    /// Returns the image configured to be resizable with the specified insets and resizing mode and scaled to fit in a frame of the specified height and alignment.
    /// - Parameters:
    ///   - height: The height of the frame containing the image.
    ///   - alignment: The alignment of the frame containing the image.
    ///   - capInsets: The amount the edges should be inset, set to no specific amount by default.
    ///   - resizingMode: The mode of resizing, set to `stretch` by default.
    func resizedToFit(height: CGFloat, alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> some View {
        self.resizedToFit(capInsets: capInsets, resizingMode: resizingMode)
            .frame(height: height, alignment: alignment)
    }
    /// Returns the image configured to be resizable with the specified insets and resizing mode and scaled to fit in a frame of the specified size and alignment.
    /// - Parameters:
    ///   - width: The width of the frame containing the image.
    ///   - height: The height of the frame containing the image.
    ///   - alignment: The alignment of the frame containing the image.
    ///   - capInsets: The amount the edges should be inset, set to no specific amount by default.
    ///   - resizingMode: The mode of resizing, set to `stretch` by default.
    func resizedToFit(width: CGFloat, height: CGFloat, alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> some View {
        self.resizedToFit(capInsets: capInsets, resizingMode: resizingMode)
            .frame(width: width, height: height, alignment: alignment)
    }
    /// Returns the image configured to be resizable with the specified insets and resizing mode and scaled to fit in a frame of the specified size and alignment.
    /// - Parameters:
    ///   - size: The size for the width and height of the frame containing the image.
    ///   - alignment: The alignment of the frame containing the image.
    ///   - capInsets: The amount the edges should be inset, set to no specific amount by default.
    ///   - resizingMode: The mode of resizing, set to `stretch` by default.
    func resizedToFit(size: CGFloat, alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> some View {
        self.resizedToFit(width: size, height: size, alignment: alignment, capInsets: capInsets, resizingMode: resizingMode)
    }
    
    // MARK: -
    // ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    /// Returns the image configured to be resizable with the specified insets and resizing mode and scaled to fill its parent.
    /// - Parameters:
    ///   - capInsets: The amount the edges should be inset, set to no specific amount by default.
    ///   - resizingMode: The mode of resizing, set to `stretch` by default.
    func resizedToFill(capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> some View {
        self.resizable(capInsets: capInsets, resizingMode: resizingMode)
            .scaledToFill()
    }
    /// Returns the image configured to be resizable with the specified insets and resizing mode and scaled to fill in a frame of the specified width and alignment.
    /// - Parameters:
    ///   - width: The width of the frame containing the image.
    ///   - alignment: The alignment of the frame containing the image.
    ///   - capInsets: The amount the edges should be inset, set to no specific amount by default.
    ///   - resizingMode: The mode of resizing, set to `stretch` by default.
    func resizedToFill(width: CGFloat, alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> some View {
        self.resizedToFill(capInsets: capInsets, resizingMode: resizingMode)
            .frame(width: width, alignment: alignment)
    }
    /// Returns the image configured to be resizable with the specified insets and resizing mode and scaled to fill in a frame of the specified height and alignment.
    /// - Parameters:
    ///   - height: The height of the frame containing the image.
    ///   - alignment: The alignment of the frame containing the image.
    ///   - capInsets: The amount the edges should be inset, set to no specific amount by default.
    ///   - resizingMode: The mode of resizing, set to `stretch` by default.
    func resizedToFill(height: CGFloat, alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> some View {
        self.resizedToFill(capInsets: capInsets, resizingMode: resizingMode)
            .frame(height: height, alignment: alignment)
    }
    /// Returns the image configured to be resizable with the specified insets and resizing mode and scaled to fit in a frame of the specified size and alignment.
    /// - Parameters:
    ///   - width: The width of the frame containing the image.
    ///   - height: The height of the frame containing the image.
    ///   - alignment: The alignment of the frame containing the image.
    ///   - capInsets: The amount the edges should be inset, set to no specific amount by default.
    ///   - resizingMode: The mode of resizing, set to `stretch` by default.
    func resizedToFill(width: CGFloat, height: CGFloat, alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> some View {
        self.resizedToFill(capInsets: capInsets, resizingMode: resizingMode)
            .frame(width: width, height: height, alignment: alignment)
    }
    /// Returns the image configured to be resizable with the specified insets and resizing mode and scaled to fit in a frame of the specified size and alignment.
    /// - Parameters:
    ///   - size: The size for the width and height of the frame containing the image.
    ///   - alignment: The alignment of the frame containing the image.
    ///   - capInsets: The amount the edges should be inset, set to no specific amount by default.
    ///   - resizingMode: The mode of resizing, set to `stretch` by default.
    func resizedToFill(size: CGFloat, alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> some View {
        self.resizedToFill(width: size, height: size, alignment: alignment, capInsets: capInsets, resizingMode: resizingMode)
    }
}

#if os(iOS)
public extension UIImage {
    /// Creates an image object from the specified named asset.
    /// - Parameter bundleName: The name of the image asset or file in the bundle. For images in asset catalogs, specify the name of the image asset. For PNG images, you may omit the filename extension. For all other file formats, always include the filename extension.
    convenience init(bundleName: String) {
        self.init(named: bundleName)!
    }
    
    /// Returns the `UIImage` of the application icon.
    static var appIcon: UIImage { UIImage(bundleName: "AppIcon") }
}
#endif

#if os(macOS)
public extension NSImage {
    /// Creates an image object associated with the specified name.
    /// - Parameter bundleName: The name associated with the desired image in your app bundle.
    convenience init(bundleName: String) {
        self.init(named: bundleName)!
    }
    
    /// Returns the `NSImage` of the application icon.
    static var appIcon: NSImage { NSImage(bundleName: "AppIcon") }
}
#endif
