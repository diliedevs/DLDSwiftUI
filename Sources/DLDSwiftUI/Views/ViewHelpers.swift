//
//  ViewHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 06/10/2022.
//  Copyright © 2022 DiLieDevs. All rights reserved.
//

import SwiftUI

public extension View {
    /// Hides this view when the provided condition is met.
    /// - Parameter condition: A Boolean value that determines whether this view is hidden or displayed.
    func hidden(if condition: Bool) -> some View {
        self.opacity(condition ? 0 : 1).disabled(condition).accessibilityHidden(condition)
    }
    
    /// Embeds the receiving view in a list with the given list style
    /// - Parameter style: The list style to apply to the list.
    /// - Returns: The receiving view embedded in a list with the given style.
    func inList<LS: ListStyle>(style: LS = .automatic) -> some View {
        List {
            self
        }
        .listStyle(style)
    }
    
    /// Adds the given amount of padding to the horizontal and vertical edges of the receiving view.
    /// - Parameters:
    ///   - horizontal: The amount of padding for the leading and trailing edges.
    ///   - vertical: The amount of padding for the top and bottom edges.
    /// - Returns: A view that’s padded by the specified amount on the specified edges.
    func padding(horizontal: CGFloat?, vertical: CGFloat?) -> some View {
        self
            .padding(.horizontal, horizontal)
            .padding(.vertical, vertical)
    }
    
    func onPublish(of publisher: NotificationCenter.Publisher, perform action: @escaping BasicAction) -> some View {
        self.onReceive(publisher) { _ in
            action()
        }
    }
}

public extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: @autoclosure () -> Bool, modifier: @escaping (Self) -> Content) -> some View {
        if condition() {
            modifier(self)
        } else {
            self
        }
    }
    
    func iOS<Content: View>(_ modifier: @escaping (Self) -> Content) -> some View {
        #if os(iOS)
        modifier(self)
        #else
        self
        #endif
    }
    
    func macOS<Content: View>(_ modifier: @escaping (Self) -> Content) -> some View {
        #if os(macOS)
        modifier(self)
        #else
        self
        #endif
    }
}

public extension View {
    func debugBorder(_ color: Color = .red) -> some View {
        self.border(color, width: 2)
    }
    
    func debugPrint(_ value: @autoclosure () -> Any) -> some View {
        #if DEBUG
        print(value())
        #endif
        
        return self
    }
    
    func debugExecute(_ function: BasicAction) -> some View {
        #if DEBUG
        function()
        #endif
        
        return self
    }
    
    func debugExecute(_ function: (Self) -> Void) -> some View {
        #if DEBUG
        function(self)
        #endif
        
        return self
    }
}
