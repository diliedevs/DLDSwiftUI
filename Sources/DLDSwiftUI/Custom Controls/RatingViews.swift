//
//  RatingViews.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 28/11/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

public struct RatingView: View {
    let rating: Int
    var maxRating: Int
    var spacing: CGFloat?
    
    public init(rating: Int, maxRating: Int = 5, spacing: CGFloat? = nil) {
        self.rating    = rating
        self.maxRating = maxRating
        self.spacing   = spacing
    }
    
    public var body: some View {
        HStack(spacing: spacing) {
            ForEach(1..<maxRating + 1) { number in
                Image(symbol: number > rating ? .star : .starFill)
            }
        }
    }
}

public struct RatingControl: View {
    @Binding var rating : Int
    var maxRating       : Int
    var spacing         : CGFloat?
    @State private var fullWidth: CGFloat = .zero
    @GestureState var dragState: DragGesture.Value?
    
    private var starWidth: CGFloat { fullWidth / CGFloat(maxRating) }
    
    public init(rating: Binding<Int>, maxRating: Int = 5, spacing: CGFloat? = nil) {
        self._rating   = rating
        self.maxRating = maxRating
        self.spacing   = spacing
    }
    
    public var body: some View {
        HStack(spacing: spacing) {
            ForEach(1..<maxRating + 1) { number in
                Image(systemName: number > rating ? "star" : "star.fill")
                    .onTapGesture {
                        withAnimation {
                            rating = rating == number ? number - 1 : number
                        }
                    }
            }
        }
        .background(
            GeometryReader { geo in
                Color.clear
                    .preference(key: RatingSizePreferenceKey.self, value: geo.size)
            }
        )
        .onPreferenceChange(RatingSizePreferenceKey.self) { fullWidth = $0.width }
        .gesture(
            DragGesture()
                .updating($dragState) { gesture, state, transaction in
                    state = gesture
                    updateRating()
                }
        )
    }
    
    func updateRating() {
        guard let dragState = dragState else { return }
        let location       = dragState.location.x
        let transWidth     = dragState.translation.width
        let isGoingBack    = transWidth < 0
        let exactLocRating = location / starWidth
        let locRating      = Int(isGoingBack ? floor(exactLocRating) : ceil(exactLocRating))
        
        withAnimation {
            if location < 0              { rating = 0 }
            else if location > fullWidth { rating = maxRating }
            else {
                if isGoingBack && rating > locRating { rating = locRating }
                else if rating < locRating           { rating = locRating }
            }
        }
    }
}

private extension RatingControl {
    struct RatingSizePreferenceKey: PreferenceKey {
        static var defaultValue: CGSize = .zero
        static func reduce(value: inout CGSize, nextValue: () -> CGSize) {  }
    }
}
