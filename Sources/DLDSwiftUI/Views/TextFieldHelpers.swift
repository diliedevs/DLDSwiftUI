//
//  TextFieldHelpers.swift
//  
//
//  Created by Dionne Lie Sam Foek on 13/05/2023.
//  Copyright © 2023 DiLieDevs. All rights reserved.
//

import SwiftUI

@available(macOS 13.0, iOS 16.0, *)
public extension TextField where Label == Text {
    init<S: StringProtocol>(_ title: S, text: Binding<String>, tip: S? = nil, axis: Axis? = nil) {
        if let axis {
            self.init(title, text: text, prompt: Text(tip ?? title), axis: axis)
        } else {
            self.init(title, text: text, prompt: Text(tip ?? title))
        }
    }
}
