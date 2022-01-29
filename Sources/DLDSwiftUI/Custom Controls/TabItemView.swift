//
//  TabItemView.swift
//  
//
//  Created by Dionne Lie-Sam-Foek on 29/01/2022.
//

import SwiftUI

public struct TabItemView<Content: View>: View {
    let titleText: Text
    let labelIcon: Image
    let tag: String?
    @ViewBuilder var content: () -> Content
    
    public init(_ titleKey: LocalizedStringKey, image imageName: String, tag: String?, @ViewBuilder content: @escaping () -> Content) {
        self.titleText = Text(titleKey)
        self.labelIcon = Image(imageName)
        self.tag       = tag
        self.content   = content
    }
    
    public init<S: StringProtocol>(_ title: S, image imageName: String, tag: String?, @ViewBuilder content: @escaping () -> Content) {
        self.titleText = Text(title)
        self.labelIcon = Image(imageName)
        self.tag       = tag
        self.content   = content
    }
    
    public init(_ titleKey: LocalizedStringKey, systemImage symbolName: String, tag: String?, @ViewBuilder content: @escaping () -> Content) {
        self.titleText = Text(titleKey)
        self.labelIcon = Image(systemName: symbolName)
        self.tag       = tag
        self.content   = content
    }
    
    public init<S: StringProtocol>(_ title: S, systemImage symbolName: String, tag: String?, @ViewBuilder content: @escaping () -> Content) {
        self.titleText = Text(title)
        self.labelIcon = Image(systemName: symbolName)
        self.tag       = tag
        self.content   = content
    }
    
    public var body: some View {
        content()
            .tag(tag)
            .tabItem {
                Label {
                    titleText
                } icon: {
                    labelIcon
                }
            }
    }
}
