//
//  SwiftUIView.swift
//  
//
//  Created by Dionne Lie-Sam-Foek on 29/12/2020.
//

import SwiftUI

@available(OSX 11.0, iOS 14.0, *)
/// A button that can be placed in the toolbar or navigation bar.
public struct ToolbarButton: ToolbarContent {
    /// Which section of the toolbar the button should be placed in.
    public let placement   : ToolbarItemPlacement
    /// The localizable title of the button.
    public let title       : LocalizedStringKey
    /// The name of the `SF Symbols` system image for the button, if the button should show an icon.
    public let systemImage : String?
    /// Whether or not to show the button.
    public let presented   : Bool
    /// The action for the button.
    public let action      : () -> Void
    
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
        ToolbarButton(placement: .cancellationAction, title: "cancel", action: action)
    }
    
    /// Creates a toolbar button that represents a confirmation action for a modal interface.
    /// - Parameters:
    ///   - title: The localizable title for the confirmation button.
    ///   - action: The action to take when the user confirms the modal interface.
    public static func confirm(title: LocalizedStringKey, action: @escaping () -> Void) -> ToolbarButton {
        ToolbarButton(placement: .confirmationAction, title: title, action: action)
    }
}

@available(OSX 11.0, iOS 14.0, *)
/// A title that can be placed prominently in the toolbar or navigation bar, with or without an image.
public struct ToolbarTitle: ToolbarContent {
    /// The localizable title.
    public let title : LocalizedStringKey
    /// The image to precede the title.
    public let image : Image?
    /// The font to use for the title.
    public let font  : Font
    /// The color to use for the title.
    public let color : Color
    
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
