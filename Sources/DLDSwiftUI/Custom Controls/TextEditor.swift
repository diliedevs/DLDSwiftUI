//
//  TextEditor.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 21/11/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

public extension TextEditor {
    func withPlaceholder(_ placeholder: String, for text: Binding<String>) -> some View {
        ZStack(alignment: .topLeading) {
            if text.wrappedValue.isEmpty {
                Text(placeholder)
                    .foregroundColor(.secondary)
                    .padding(EdgeInsets(top: 8, leading: 4, bottom: 0, trailing: 0))
            }
            
            self
        }
        #if os(iOS)
            .onAppear { UITextView.appearance().backgroundColor = .clear }
            .onDisappear { UITextView.appearance().backgroundColor = nil }
        #endif
    }
}

public extension View {
    func withClearButton(for text: Binding<String>) -> some View {
        HStack {
            self
            
            Button {
                text.wrappedValue = ""
            } label: {
                Label("Clear", systemImage: "multiply.circle.fill")
                    .foregroundColor(.secondary.opacity(0.5))
                    .labelStyle(.iconOnly)
            }
            .hidden(if: text.wrappedValue.isEmpty)
            #if os(macOS)
                .buttonStyle(.borderless)
            #endif
        }
    }
}
