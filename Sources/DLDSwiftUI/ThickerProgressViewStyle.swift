//
//  SwiftUIView.swift
//  
//
//  Created by Dionne Lie-Sam-Foek on 29/12/2020.
//

import SwiftUI

@available(OSX 11.0, iOS 14.0, *)
public struct ThickerProgressViewStyle: ProgressViewStyle {
    public enum LabelPlacement: String {
        case top, bottom, topLeading, topTrailing, bottomLeading, bottomTrailing
        
        public var alignment: Alignment {
            switch self {
            case .top, .bottom                 : return .center
            case .topLeading, .bottomLeading   : return .leading
            case .topTrailing, .bottomTrailing : return .trailing
            }
        }
        
        public var isTop    : Bool { rawValue.hasPrefix("top") }
        public var isBottom : Bool { rawValue.hasPrefix("bottom") }
    }
    
    public var thickness      : CGFloat
    public var labelPlacement : LabelPlacement = .topLeading
    public var labelSpacing   : CGFloat?       = nil // swiftlint:disable:this redundant_optional_initialization
    public var accentColor    : Color          = .accentColor
    public var font           : Font           = .body
    
    public func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: labelSpacing) {
            
            if labelPlacement.isTop {
                labelView(for: configuration, at: labelPlacement)
            }
            
            ProgressView(value: configuration.fractionCompleted)
                .scaleEffect(x: 1, y: thickness, anchor: scalingAnchor(for: configuration))
                .accentColor(accentColor)
            
            if labelPlacement.isBottom {
                labelView(for: configuration, at: labelPlacement)
            }
        }
    }
    
    private func labelView(for config: Configuration, at placement: LabelPlacement) -> some View {
        Group {
            if let label = config.label {
                label
                    .font(font)
                    .frame(maxWidth: .infinity, alignment: labelPlacement.alignment)
            }
        }
    }
    
    private func scalingAnchor(for config: Configuration) -> UnitPoint {
        guard config.label != nil else { return .center }
        
        if labelPlacement.isTop         { return .top }
        else if labelPlacement.isBottom { return .bottom}
        else                            { return .center }
    }
}
