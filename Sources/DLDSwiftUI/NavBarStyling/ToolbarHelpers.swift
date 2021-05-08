//
//  ToolbarHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 29/12/2020.
//  Copyright © 2020 DiLieDevs. All rights reserved.
//

import SwiftUI

/// A button that can be placed in the toolbar or navigation bar.
public struct ToolbarButton: ToolbarContent {
    let placement   : ToolbarItemPlacement
    let title       : LocalizedStringKey
    let systemImage : String?
    let presented   : Bool
    let action      : () -> Void
    
    /// Creates a button that can be placed in the toolbar or navigation bar.
    /// - Parameters:
    ///   - placement: Which section of the toolbar the button should be placed in. Default is `automatic`.
    ///   - title: The localizable title of the button.
    ///   - systemImage: The name of the `SF Symbols` system image for the button, if the button should show an icon. Default is `nil`.
    ///   - presented: Whether or not to show the button. Default is `true`.
    ///   - action: The action for the button.
    public init(placement: ToolbarItemPlacement = .automatic, title: LocalizedStringKey, systemImage: String? = nil, presented: Bool = true, action: @escaping () -> Void) {
        self.placement   = placement
        self.title       = title
        self.systemImage = systemImage
        self.presented   = presented
        self.action      = action
    }
    
    /// The content and behavior of the view.
    public var body: some ToolbarContent {
        ToolbarItem(placement: placement) {
            if presented {
                if let sysImg = systemImage {
                    LabeledButton(title, systemImage: sysImg, action: action)
                } else {
                    Button(title, action: action)
                }
            }
        }
    }
    
    /// Creates a toolbar button with the localizable text of *'cancel'* to represent a cancellation action for a modal interface.
    /// - Parameter action: The action to take when the user cancels out of the modal interface.
    public static func cancel(_ action: @escaping () -> Void) -> ToolbarButton {
        ToolbarButton(placement: .cancellationAction, title: "cancel", systemImage: nil, action: action)
    }
    
    /// Creates a toolbar button that represents a confirmation action for a modal interface.
    /// - Parameters:
    ///   - title: The localizable title for the confirmation button.
    ///   - action: The action to take when the user confirms the modal interface.
    public static func confirm(title: LocalizedStringKey, action: @escaping () -> Void) -> ToolbarButton {
        ToolbarButton(placement: .confirmationAction, title: title, systemImage: nil, action: action)
    }
}

@available(OSX, deprecated: 11.3, message: "Use NavigationBar styling instead")
@available(iOS, deprecated: 14.5, message: "Use NavigationBar styling instead")
/// A title that can be placed prominently in the toolbar or navigation bar, with or without an image.
public struct ToolbarTitle: ToolbarContent {
    let title : LocalizedStringKey
    let image : Image?
    let font  : Font
    let color : Color
    
    /// Creates a title that can be placed prominently in the toolbar or navigation bar, with or without an image.
    /// - Parameters:
    ///   - title: The localizable title.
    ///   - image: The image to precede the title. Default is `nil`.
    ///   - font: The font to use for the title. Default is the system font in a title text style.
    ///   - color: The color to use for the title. Default is the primary color.
    public init(_ title: LocalizedStringKey, image: Image? = nil, font: Font = .title, color: Color = .primary) {
        self.title = title
        self.image = image
        self.font  = font
        self.color = color
    }
    
    /// Creates a title that can be placed prominently in the toolbar or navigation bar, with or without an image.
    /// - Parameters:
    ///   - title: The title string.
    ///   - image: The image to precede the title. Default is `nil`.
    ///   - font: The font to use for the title. Default is the system font in a title text style.
    ///   - color: The color to use for the title. Default is the primary color.
    public init(_ title: String, image: Image? = nil, font: Font = .title, color: Color = .primary) {
        self.init(LocalizedStringKey(title), image: image, font: font, color: color)
    }
    
    /// The content and behavior of the view.
    public var body: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Group {
                if let img = image {
                    HStack {
                        img.imageScale(.small)
                        Text(title)
                    }
                } else {
                    Text(title)
                }
            }
            .font(font, color: color)
        }
    }
}

#if os(iOS)
public extension ToolbarItemPlacement {
    /// Shorthand alias for `navigationBarLeading`.
    static let navLeading = Self.navigationBarLeading
    /// Shorthand alias for `navigationBarTrailing`.
    static let navTrailing = Self.navigationBarTrailing
}
#endif
