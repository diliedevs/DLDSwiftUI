//
//  PromptedTextEditor.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 28/11/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

@available(macOS 12.0, iOS 15.0, *)
public struct PromptedTextEditor: View {
    @Binding var text   : String
    let prompt          : String
    let foregroundColor : Color
    let insets          : EdgeInsets
    @FocusState private var isEditing: Bool
    
    public init(text: Binding<String>, prompt: String, foregroundColor: Color = .primary, insets: EdgeInsets = EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8)) {
        self._text           = text
        self.prompt          = prompt
        self.foregroundColor = foregroundColor
        self.insets          = insets
    }
    
    public var body: some View {
        TextEditor(text: $text)
            .onAppear(perform: showPlaceholder)
            .focused($isEditing)
            .onChange(of: isEditing) { _ in showPlaceholder() }
            .foregroundColor(color)
            .padding(insets)
    }
}

@available(macOS 12.0, iOS 15.0, *)
private extension PromptedTextEditor {
    var shouldShowPlaceholder: Bool {
        if isEditing { return false }
        else         { return text.isEmpty || text == prompt }
    }
    
    var color: Color {
        if shouldShowPlaceholder {
            #if os(iOS)
            return Color(uiColor: .placeholderText)
            #endif
            #if os(macOS)
            return Color(nsColor: .placeholderTextColor)
            #endif
        } else {
            return foregroundColor
        }
    }
    
    func showPlaceholder() {
        withAnimation {
            if shouldShowPlaceholder { text = prompt }
            else { text = text == prompt ? "" : text }
        }
    }
}
