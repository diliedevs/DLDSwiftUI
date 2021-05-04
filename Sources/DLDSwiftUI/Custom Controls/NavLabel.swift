//
//  NavLabel.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 04/05/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

public struct NavLabel<Destination: View>: View {
    public let titleKey    : LocalizedStringKey
    public let destination : Destination
    
    private let imageName : String
    private let symbol    : Symbol?
    
    public init(titleKey: LocalizedStringKey, symbol: Symbol, destination: Destination) {
        self.titleKey    = titleKey
        self.destination = destination
        self.imageName   = symbol.rawValue
        self.symbol      = symbol
    }
    
    public init(titleKey: LocalizedStringKey, imageName: String, destination: Destination) {
        self.titleKey    = titleKey
        self.destination = destination
        self.imageName   = imageName
        self.symbol      = nil
    }
    
    public var body: some View {
        NavigationLink(destination: destination) {
            if let symbol = symbol {
                Label(titleKey, symbol: symbol)
            } else {
                Label(titleKey, image: imageName)
            }
        }
    }
}
