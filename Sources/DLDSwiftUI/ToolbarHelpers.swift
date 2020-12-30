//
//  SwiftUIView.swift
//  
//
//  Created by Dionne Lie-Sam-Foek on 29/12/2020.
//

import SwiftUI

@available(OSX 11.0, iOS 14.0, *)
public struct ToolbarButton: ToolbarContent {
    public let placement   : ToolbarItemPlacement
    public let title       : LocalizedStringKey
    public let systemImage : String?
    public let presented   : Bool
    public let action      : () -> Void
    
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
    
    public static func cancel(_ action: @escaping () -> Void) -> ToolbarButton {
        ToolbarButton(placement: .cancellationAction, title: "cancel", action: action)
    }
    
    public static func confirm(title: LocalizedStringKey, action: @escaping () -> Void) -> ToolbarButton {
        ToolbarButton(placement: .confirmationAction, title: title, action: action)
    }
}

@available(OSX 11.0, iOS 14.0, *)
public struct ToolbarTitle: ToolbarContent {
    public let title : LocalizedStringKey
    public let image : Image?
    public let font  : Font
    public let color : Color
    
    public init(_ title: LocalizedStringKey, image: Image? = nil, font: Font = .title, color: Color = .primary) {
        self.title = title
        self.image = image
        self.font  = font
        self.color = color
    }
    
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
