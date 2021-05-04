//
//  LocalizationHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 04/05/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

public extension LocalizedStringKey {
    var stringKey: String {
        let description  = "\(self)"
        let components   = description.components(separatedBy: ", ")
        let keyComponent = components[0].components(separatedBy: ": ")
        
        return keyComponent[1].replacingOccurrences(of: "\"", with: "")
    }
    
    var stringValue: String { NSLocalizedString(stringKey, comment: "") }
}
