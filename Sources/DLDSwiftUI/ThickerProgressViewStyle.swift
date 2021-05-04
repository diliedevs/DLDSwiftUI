//
//  ThickerProgressViewStyle.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 29/12/2020.
//  Copyright © 2020 DiLieDevs. All rights reserved.
//

import SwiftUI

/// A progress view style that indicatess its progress using a horizontal bar
/// where the thickness of the bar can be configured as well as the label.
public struct ThickerProgressViewStyle: ProgressViewStyle {
    /// A set of cases indicating the vertical placement of the progress view's label.
    public enum LabelPlacement: String {
        case top, bottom, topLeading, topTrailing, bottomLeading, bottomTrailing
        
        /// Returns the horizontal text alignment of the label.
        public var alignment: Alignment {
            switch self {
            case .top, .bottom                 : return .center
            case .topLeading, .bottomLeading   : return .leading
            case .topTrailing, .bottomTrailing : return .trailing
            }
        }
        
        /// Returns `true` when the placement for the label is above the progress view bar.
        public var isTop    : Bool { rawValue.hasPrefix("top") }
        /// Returns `true` when the placement for the label is below the progress view bar.
        public var isBottom : Bool { rawValue.hasPrefix("bottom") }
    }
    
    /// The thickness of the progress view bar.
    public var thickness      : CGFloat
    /// The vertical placement of the progress view's label.
    public var labelPlacement : LabelPlacement
    /// The space between the the progress view bar and it's label.
    public var labelSpacing   : CGFloat?
    /// The accent color for the progress view bar.
    public var accentColor    : Color
    /// The font of the progress view's label.
    public var font           : Font
    
    /// Creates a `ThickerProgressViewStyle` with the given configuration values.
    /// - Parameters:
    ///   - thickness: The thickness of the progress view bar.
    ///   - labelPlacement: The vertical placement of the progress view's label.
    ///   - labelSpacing: The space between the the progress view bar and it's label.
    ///   - accentColor: The accent color for the progress view bar.
    ///   - font: The font of the progress view's label.
    public init(thickness: CGFloat = 2, labelPlacement: ThickerProgressViewStyle.LabelPlacement = .topLeading, labelSpacing: CGFloat? = nil, accentColor: Color = .accentColor, font: Font = .body) {
        self.thickness      = thickness
        self.labelPlacement = labelPlacement
        self.labelSpacing   = labelSpacing
        self.accentColor    = accentColor
        self.font           = font
    }
    
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
