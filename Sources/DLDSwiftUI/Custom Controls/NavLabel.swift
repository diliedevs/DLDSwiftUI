//
//  NavLabel.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 04/05/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

/// A simple navigation link with a title and icon as its label.
public struct NavLabel<Destination: View>: View {
    let destination : Destination
    let label       : Label<Text, Image>
    
    /// Creates a navigation link that presents the destination view.
    /// - Parameters:
    ///   - titleKey: The key for the localized title describing the navigation links destination.
    ///   - symbol: The symbol for the navigation links icon.
    ///   - destination: The view for the navigation link to present.
    public init(title titleKey: LocalizedStringKey, symbol: Symbol, destination: Destination) {
        self.destination = destination
        self.label       = Label(titleKey, symbol: symbol)
    }
    
    /// Creates a navigation link that presents the destination view.
    /// - Parameters:
    ///   - titleKey: The key for the localized title describing the navigation links destination.
    ///   - imgName: The name of the image to use for the navigation links icon.
    ///   - destination: The view for the navigation link to present.
    public init(title titleKey: LocalizedStringKey, image imgName: String, destination: Destination) {
        self.destination = destination
        self.label       = Label(titleKey, image: imgName)
    }
    
    /// The content and behavior of the view.
    public var body: some View {
        NavigationLink(destination: destination) {
            label
        }
    }
}
