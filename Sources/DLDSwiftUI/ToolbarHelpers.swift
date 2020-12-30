//
//  SwiftUIView.swift
//  
//
//  Created by Dionne Lie-Sam-Foek on 29/12/2020.
//

import SwiftUI

@available(OSX 11.0, iOS 14.0, *)
public struct ToolbarButton<Content: View>: ToolbarContent {
    public let placement : ToolbarItemPlacement
    public let presented : Bool
    public let content   : () -> Content
    
    public init(placement: ToolbarItemPlacement = .automatic, presented: Bool = true, @ViewBuilder content: @escaping () -> Content) {
        self.placement = placement
        self.presented = presented
        self.content   = content
    }
    
    public var body: some ToolbarContent {
        ToolbarItem(placement: placement) {
            if presented {
                content()
            }
        }
    }
    
    public static func cancel(_ action: @escaping () -> Void) -> ToolbarButton {
        ToolbarButton(placement: .cancellationAction, presented: true) {
            Button("CANCEL", action: action) as! Content
        }
    }
    
    public static func confirm(title: LocalizedStringKey, action: @escaping () -> Void) -> ToolbarButton {
        ToolbarButton(placement: .confirmationAction, presented: true) {
            Button(title, action: action) as! Content
        }
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
