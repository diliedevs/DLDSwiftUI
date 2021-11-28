//
//  ViewHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 29/12/2020.
//  Copyright © 2020 DiLieDevs. All rights reserved.
//

import SwiftUI

public extension View {
    /// Erases the view type to `AnyView`.
    func asAnyView() -> AnyView {
        AnyView(self)
    }
    
    /// Returns a view with it background set to the specifiied color of the given opacity.
    /// - Parameters:
    ///   - color: The color to fill the background with.
    func backgroundColor(_ color: Color) -> some View {
        self.background(color)
    }
    
    /// Sets the default font for text in the view and the color that the view uses for foreground elements.
    /// - Parameters:
    ///   - font: The default font to use in the view.
    ///   - color: The color to use in the view for foreground elements.
    func font(_ font: Font?, color: Color?) -> some View {
        self.font(font).foregroundColor(color)
    }
    
    /// Hides this view when the provided condition is met.
    /// - Parameter condition: A Boolean value that determines whether this view is hidden or displayed.
    func hidden(if condition: Bool) -> some View {
        Group {
            if condition {
                self.hidden()
            } else {
                self
            }
        }
    }
    
    func inNavView() -> some View {
        NavigationView {
            self
        }
    }
    
    func inList<LS: ListStyle>(style: LS) -> some View {
        List {
            self
        }
        .listStyle(style)
    }
    
    func withClearButton(for text: Binding<String>) -> some View {
        HStack {
            self
            
            Button {
                text.wrappedValue = ""
            } label: {
                Label("Clear", systemImage: "multiply.circle.fill")
                    .foregroundColor(.secondary.opacity(0.5))
                    .labelStyle(.iconOnly)
            }
            .hidden(if: text.wrappedValue.isEmpty)
            #if os(macOS)
            .buttonStyle(.borderless)
            #endif
        }
    }
    
    // MARK: - Padding
    func padding(horizontal: CGFloat?, vertical: CGFloat?) -> some View {
        self
            .padding(.horizontal, horizontal)
            .padding(.vertical, vertical)
    }
    
    // MARK: - Frame
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
