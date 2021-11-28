//
//  Button.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 21/11/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

@available(macOS 12.0, iOS 15.0.0, *)
public extension Button where Label == Text {
    static func cancel(action: @escaping BasicAction) -> Self {
        Button("Cancel", role: .cancel, action: action)
    }
    
    static func delete(action: @escaping BasicAction) -> Self {
        Button("Delete", role: .destructive, action: action)
    }
}
