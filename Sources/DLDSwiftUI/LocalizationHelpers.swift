//
//  LocalizationHelpers.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 06/10/2022.
//  Copyright © 2022 DiLieDevs. All rights reserved.
//

import SwiftUI

public extension LocalizedStringKey {
    /// Returns the key for the localized string.
    var stringKey: String {
        let props = Mirror(reflecting: self).properties
        return props.first(where: { $0.label == "key" })?.value as? String ?? ""
    }
    
    /// Returns the localized string value.
    var stringValue: String { NSLocalizedString(stringKey, comment: "") }
}

fileprivate extension Mirror {
    struct Property {
        let label: String
        let value: Any
        
        init?(label: String?, value: Any) {
            guard let label = label else { return nil }
            
            self.label = label
            self.value = value
        }
    }
    
    var properties: [Property] { children.compactMap(Property.init) }
}
