//
//  ProgressViews.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 28/11/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

public struct ProgressBar<V: BinaryFloatingPoint>: View {
    let value        : V
    let total        : V
    let color        : Color
    let height       : CGFloat
    let cornerRadius : CGFloat
    
    private var progress: V { total == 1.0 ? value : value / total }
    
    public init(value: V, total: V = 1.0, color: Color = .accentColor, height: CGFloat = 4, cornerRadius: CGFloat = 10) {
        self.value        = value
        self.total        = total
        self.color        = color
        self.height       = height
        self.cornerRadius = cornerRadius
    }
    
    public var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(color.opacity(0.25))
                
                Rectangle()
                    .fill(color)
                    .frame(width: geo.minWidth(for: progress))
                    .animation(.linear, value: progress)
            }
            .cornerRadius(cornerRadius)
        }
        .frame(height: height)
    }
}

private extension GeometryProxy {
    func minWidth<V: BinaryFloatingPoint>(for value: V) -> CGFloat {
        min(size.width, size.width * CGFloat(value))
    }
}

public struct ProgressRing<V: BinaryFloatingPoint>: View {
    let value     : V
    let total     : V
    let color     : Color
    let ringWidth : CGFloat
    
    public init(value: V, total: V = 1.0, color: Color = .accentColor, ringWidth: CGFloat = 10) {
        self.value = value
        self.total = total
        self.color = color
        self.ringWidth = ringWidth
    }
    
    private var progress: V { total == 1.0 ? value : value / total }
    
    public var body: some View {
        ZStack {
            Circle()
                .strokeBorder(lineWidth: ringWidth)
                .foregroundColor(color.quarter)
            
            Circle()
                .inset(by: ringWidth / 2)
                .trim(from: 0, to: CGFloat(progress))
                .stroke(style: .init(lineWidth: ringWidth, lineCap: .round))
                .foregroundColor(color)
                .rotationEffect(.degrees(-90))
                .animation(.easeIn, value: progress)
        }
    }
}
