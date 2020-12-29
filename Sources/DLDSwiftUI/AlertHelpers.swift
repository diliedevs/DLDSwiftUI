//
//  SwiftUIView.swift
//  
//
//  Created by Dionne Lie-Sam-Foek on 29/12/2020.
//

import SwiftUI

@available(OSX 11.0, iOS 14.0, *)
public extension Alert {
    struct TitleMessage: Identifiable {
        public let id = UUID()
        public let title   : LocalizedStringKey
        public let message : LocalizedStringKey
        
        init(_ title: LocalizedStringKey, message: LocalizedStringKey) {
            self.title   = title
            self.message = message
        }
    }
    
    init(titleMsg: TitleMessage, primaryButton: Alert.Button, secondaryButton: Alert.Button) {
        self.init(title: Text(titleMsg.title),
                  message: Text(titleMsg.message),
                  primaryButton: primaryButton,
                  secondaryButton: secondaryButton
        )
    }
    
    init(titleMsg: TitleMessage, dismissButton: Alert.Button? = nil) {
        self.init(title: Text(titleMsg.title), message: Text(titleMsg.message), dismissButton: dismissButton)
    }
}

@available(OSX 11.0, iOS 14.0, *)
public extension Alert.Button {
    static func basic(_ title: LocalizedStringKey, action: (() -> Void)? = {}) -> Alert.Button {
        Self.default(Text(title), action: action)
    }
    
    static func ok(action: (() -> Void)? = {}) -> Alert.Button {
        basic("OK", action: action)
    }
    
    static func destructive(_ title: LocalizedStringKey, action: (() -> Void)? = {}) -> Alert.Button {
        destructive(Text(title), action: action)
    }
}
