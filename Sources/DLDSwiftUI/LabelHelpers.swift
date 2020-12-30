//
//  SwiftUIView.swift
//  
//
//  Created by Dionne Lie-Sam-Foek on 30/12/2020.
//

import SwiftUI

@available(OSX 11.0, iOS 14.0, *)
public struct FullLabelStyle: LabelStyle {
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
            configuration.title
        }
    }
}

@available(OSX 11.0, iOS 14.0, *)
public extension View {
    func defaultLabel() -> some View {
        self.labelStyle(DefaultLabelStyle())
    }
    func fullLabel() -> some View {
        self.labelStyle(FullLabelStyle())
    }
    func iconOnlyLabel() -> some View {
        self.labelStyle(IconOnlyLabelStyle())
    }
    func titleOnlyLabel() -> some View {
        self.labelStyle(TitleOnlyLabelStyle())
    }
}

@available(OSX 11.0, iOS 14.0, *)
public struct LabeledButton: View {
    public let title       : LocalizedStringKey
    public let systemImage : String
    public let action      : () -> Void
    
    public init(_ title: LocalizedStringKey, systemImage: String, action: @escaping () -> Void) {
        self.title        = title
        self.systemImage  = systemImage
        self.action       = action
    }
    
    public var body: some View {
        Button(action: action) {
            Label(title, systemImage: systemImage)
        }
    }
}
