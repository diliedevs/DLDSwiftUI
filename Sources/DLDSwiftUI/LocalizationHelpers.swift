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
        let props = Mirror(reflecting: self).properties
        return props.first(where: { $0.label == "key" })?.value as? String ?? ""
    }
    
    var stringValue: String { NSLocalizedString(stringKey, comment: "") }
}

public extension Mirror {
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
