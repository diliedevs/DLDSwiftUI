//
//  OnFirstAppearModifier.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie Sam Foek  on 12/11/2022.
//

import SwiftUI

public struct OnFirstAppearModifier: ViewModifier {
    @State private var hasLoaded = false
    public var action: BasicAction
    
    public init(perform action: @escaping BasicAction) {
        self.action = action
    }
    
    public func body(content: Content) -> some View {
        content.onAppear {
            guard hasLoaded == false else { return }
            
            hasLoaded = true
            action()
        }
    }
}

public extension View {
    func onFirstAppear(perform action: @escaping BasicAction) -> some View {
        modifier(OnFirstAppearModifier(perform: action))
    }
}
