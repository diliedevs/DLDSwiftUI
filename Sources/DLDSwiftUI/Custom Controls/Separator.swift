//
//  Separator.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 04/05/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

public struct Separator: View {
    public var color: Color? = .none
    
    public init(in color: Color? = .none) {
        self.color = color
    }
    
    public var body: some View {
        Divider()
            .background(
                Group {
                    if let clr = color { clr }
                }
            )
    }
}
