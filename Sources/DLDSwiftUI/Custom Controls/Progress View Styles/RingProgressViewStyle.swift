//
//  RingProgressViewStyle.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 05/12/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

@available(macOS 12.0, iOS 15.0, *)
public struct RingProgressViewStyle: ProgressViewStyle {
    var completedColor : Color
    var incompleteColor: Color
    var ringWidth      : CGFloat
    
#if os(iOS)
    public init(completedColor: Color = .accentColor,
                incompleteColor: Color = Color(uiColor: .systemGray5),
                ringWidth: CGFloat = 10)
    {
        self.completedColor  = completedColor
        self.incompleteColor = incompleteColor
        self.ringWidth       = ringWidth
    }
#endif
    
#if os(macOS)
    public init(completedColor: Color = .accentColor,
                incompleteColor: Color = Color(nsColor: .separatorColor),
                ringWidth: CGFloat = 10)
    {
        self.completedColor  = completedColor
        self.incompleteColor = incompleteColor
        self.ringWidth       = ringWidth
    }
#endif
    
    public func makeBody(configuration: Configuration) -> some View {
        let progress = configuration.fractionCompleted ?? 0
        
        return ZStack {
            Circle()
                .strokeBorder(lineWidth: ringWidth)
                .foregroundColor(incompleteColor)
            
            Circle()
                .inset(by: ringWidth / 2)
                .trim(from: 0, to: progress)
                .stroke(style: .init(lineWidth: ringWidth, lineCap: .round))
                .foregroundColor(completedColor)
                .rotationEffect(.degrees(-90))
                .animation(.easeIn, value: configuration.fractionCompleted)
            
            configuration.label
        }
    }
}

@available(macOS 12.0, iOS 15.0, *)
public extension ProgressViewStyle where Self == RingProgressViewStyle {
    #if os(iOS)
    static func ring(completedColor: Color = .accentColor,
                           incompleteColor: Color = Color(uiColor: .systemGray5),
                           ringWidth: CGFloat = 10) -> Self
    {
        RingProgressViewStyle(completedColor: completedColor,
                             incompleteColor: incompleteColor,
                             ringWidth: ringWidth)
    }
    #endif
    
    #if os(macOS)
    static func ring(completedColor: Color = .accentColor,
                            incompleteColor: Color = Color(nsColor: .separatorColor),
                            ringWidth: CGFloat = 10) -> Self
    {
        RingProgressViewStyle(completedColor: completedColor,
                             incompleteColor: incompleteColor,
                             ringWidth: ringWidth)
    }
    #endif
}
