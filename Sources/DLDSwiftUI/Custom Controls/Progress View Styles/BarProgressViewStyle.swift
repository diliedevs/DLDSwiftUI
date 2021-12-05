//
//  BarProgressViewStyle.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 05/12/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

@available(macOS 12.0, iOS 15.0, *)
public struct BarProgressViewStyle: ProgressViewStyle {
    var completedColor : Color
    var incompleteColor: Color
    var height         : CGFloat
    var cornerRadius   : CGFloat
    
    #if os(iOS)
    public init(completedColor: Color = .accentColor,
                incompleteColor: Color = Color(uiColor: .systemGray5),
                height: CGFloat = 4,
                cornerRadius: CGFloat = 10)
    {
        self.completedColor  = completedColor
        self.incompleteColor = incompleteColor
        self.height          = height
        self.cornerRadius    = cornerRadius
    }
    #endif
    
    #if os(macOS)
    public init(completedColor: Color = .accentColor,
                incompleteColor: Color = Color(nsColor: .separatorColor),
                height: CGFloat = 4,
                cornerRadius: CGFloat = 10)
    {
        self.completedColor  = completedColor
        self.incompleteColor = incompleteColor
        self.height          = height
        self.cornerRadius    = cornerRadius
    }
    #endif
    
    public func makeBody(configuration: Configuration) -> some View {
        let progress = configuration.fractionCompleted ?? 0
        
        return VStack {
            configuration.label
            
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(incompleteColor)
                    
                    Rectangle()
                        .fill(completedColor)
                        .frame(width: minWidth(for: progress, in: geo.size.width))
                        .animation(.linear, value: configuration.fractionCompleted)
                }
                .cornerRadius(cornerRadius)
            }
            .frame(height: height)
        }
    }
    
    private func minWidth(for progress: Double, in geoWidth: CGFloat) -> CGFloat {
        min(geoWidth, geoWidth * CGFloat(progress))
    }
}

@available(macOS 12.0, iOS 15.0, *)
public extension ProgressViewStyle where Self == BarProgressViewStyle {
    #if os(iOS)
    static func bar(completedColor: Color = .accentColor,
                incompleteColor: Color = Color(uiColor: .systemGray5),
                height: CGFloat = 4,
                cornerRadius: CGFloat = 10) -> Self
    {
        BarProgressViewStyle(completedColor: completedColor,
                  incompleteColor: incompleteColor,
                  height: height,
                  cornerRadius: cornerRadius)
    }
    #endif
    
    #if os(macOS)
    static func bar(completedColor: Color = .accentColor,
                incompleteColor: Color = Color(nsColor: .separatorColor),
                height: CGFloat = 4,
                cornerRadius: CGFloat = 10) -> Self
    {
        BarProgressViewStyle(completedColor: completedColor,
                  incompleteColor: incompleteColor,
                  height: height,
                  cornerRadius: cornerRadius)
    }
    #endif
}
