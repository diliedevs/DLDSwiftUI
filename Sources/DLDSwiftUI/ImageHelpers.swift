//
//  File.swift
//  
//
//  Created by Dionne Lie-Sam-Foek on 30/01/2021.
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
    func resizedToFit<T: BinaryFloatingPoint>(width: T, alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> some View {
        self.resizedToFit(capInsets: capInsets, resizingMode: resizingMode)
            .width(width, alignment: alignment)
    }
    /// Returns the image configured to be resizable with the specified insets and resizing mode and scaled to fit in a frame of the specified height and alignment.
    /// - Parameters:
    ///   - height: The height of the frame containing the image.
    ///   - alignment: The alignment of the frame containing the image.
    ///   - capInsets: The amount the edges should be inset, set to no specific amount by default.
    ///   - resizingMode: The mode of resizing, set to `stretch` by default.
    func resizedToFit<T: BinaryFloatingPoint>(height: T, alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> some View {
        self.resizedToFit(capInsets: capInsets, resizingMode: resizingMode)
            .height(height, alignment: alignment)
    }
    /// Returns the image configured to be resizable with the specified insets and resizing mode and scaled to fit in a frame of the specified size and alignment.
    /// - Parameters:
    ///   - width: The width of the frame containing the image.
    ///   - height: The height of the frame containing the image.
    ///   - alignment: The alignment of the frame containing the image.
    ///   - capInsets: The amount the edges should be inset, set to no specific amount by default.
    ///   - resizingMode: The mode of resizing, set to `stretch` by default.
    func resizedToFit<TW: BinaryFloatingPoint, TH: BinaryFloatingPoint>(width: TW, height: TH, alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> some View {
        self.resizedToFit(capInsets: capInsets, resizingMode: resizingMode)
            .frame(width: width.cgfloat, height: height.cgfloat, alignment: alignment)
    }
    /// Returns the image configured to be resizable with the specified insets and resizing mode and scaled to fit in a frame of the specified size and alignment.
    /// - Parameters:
    ///   - size: The size for the width and height of the frame containing the image.
    ///   - alignment: The alignment of the frame containing the image.
    ///   - capInsets: The amount the edges should be inset, set to no specific amount by default.
    ///   - resizingMode: The mode of resizing, set to `stretch` by default.
    func resizedToFit<T: BinaryFloatingPoint>(size: T, alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> some View {
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
    func resizedToFill<T: BinaryFloatingPoint>(width: T, alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> some View {
        self.resizedToFill(capInsets: capInsets, resizingMode: resizingMode)
            .width(width, alignment: alignment)
    }
    /// Returns the image configured to be resizable with the specified insets and resizing mode and scaled to fill in a frame of the specified height and alignment.
    /// - Parameters:
    ///   - height: The height of the frame containing the image.
    ///   - alignment: The alignment of the frame containing the image.
    ///   - capInsets: The amount the edges should be inset, set to no specific amount by default.
    ///   - resizingMode: The mode of resizing, set to `stretch` by default.
    func resizedToFill<T: BinaryFloatingPoint>(height: T, alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> some View {
        self.resizedToFill(capInsets: capInsets, resizingMode: resizingMode)
            .height(height, alignment: alignment)
    }
    /// Returns the image configured to be resizable with the specified insets and resizing mode and scaled to fit in a frame of the specified size and alignment.
    /// - Parameters:
    ///   - width: The width of the frame containing the image.
    ///   - height: The height of the frame containing the image.
    ///   - alignment: The alignment of the frame containing the image.
    ///   - capInsets: The amount the edges should be inset, set to no specific amount by default.
    ///   - resizingMode: The mode of resizing, set to `stretch` by default.
    func resizedToFill<TW: BinaryFloatingPoint, TH: BinaryFloatingPoint>(width: TW, height: TH, alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> some View {
        self.resizedToFill(capInsets: capInsets, resizingMode: resizingMode)
            .frame(width: width.cgfloat, height: height.cgfloat, alignment: alignment)
    }
    /// Returns the image configured to be resizable with the specified insets and resizing mode and scaled to fit in a frame of the specified size and alignment.
    /// - Parameters:
    ///   - size: The size for the width and height of the frame containing the image.
    ///   - alignment: The alignment of the frame containing the image.
    ///   - capInsets: The amount the edges should be inset, set to no specific amount by default.
    ///   - resizingMode: The mode of resizing, set to `stretch` by default.
    func resizedToFill<T: BinaryFloatingPoint>(size: T, alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> some View {
        self.resizedToFill(width: size, height: size, alignment: alignment, capInsets: capInsets, resizingMode: resizingMode)
    }
}
