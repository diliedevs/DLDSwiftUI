//
//  RatingView.swift
//  DLDSwiftUI
//
//  Created by Dionne Lie-Sam-Foek on 04/05/2021.
//  Copyright © 2021 DiLieDevs. All rights reserved.
//

import SwiftUI

public struct RatingScale {
    public var maxValue: Int = 5
    
    public var ratings: [Int] {
        Array(0...maxValue)
    }
    
    public static let standard = RatingScale()
    
    public static func title(for rating: Int) -> LocalizedStringKey {
        let rate          = NumberFormatter.spelledOutNumber(of: rating)
        let stars         = rating == 1 ? "star" : "stars"
        let starRate      = "\(rate)\(stars)"
        return LocalizedStringKey(starRate)
    }
}

public struct RatingView: View {
    @Binding public var rating : Int
    public var scale      : RatingScale        = .standard
    public var spacing    : CGFloat?           = 1
    public var imageScale : Image.Scale        = .medium
    public var titleKey   : LocalizedStringKey = ""
    public var starColor  : Color              = .yellow
    
    public init(rating: Binding<Int>, scale: RatingScale = .standard, spacing: CGFloat? = 1, imageScale: Image.Scale = .medium, titleKey: LocalizedStringKey = "", starColor: Color = .yellow) {
        self._rating     = rating
        self.scale       = scale
        self.spacing     = spacing
        self.imageScale  = imageScale
        self.titleKey    = titleKey
        self.starColor   = starColor
    }
    
    public var body: some View {
        HStack {
            if titleKey != "" {
                Text(titleKey)
                Spacer()
            }
            
            HStack(spacing: spacing) {
                ForEach(scale.ratings, id: \.self) { num in
                    if num != scale.maxValue {
                        RatingStar(isOff: isOff(for: num))
                            .onTapGesture {
                                rating = isOff(for: num) ? num + 1 : num
                            }
                    }
                }
            }
            .help(RatingScale.title(for: rating))
        }
    }
    
    private func RatingStar(isOff: Bool) -> some View {
        Image(symbol: isOff ? .star : .starFill)
            .foregroundColor(isOff ? .secondary : starColor)
            .imageScale(imageScale)
    }
    
    private func isOff(for number: Int) -> Bool { number >= rating }
}

private extension NumberFormatter {
    class func spelledOutNumber(of number: Int) -> String {
        let numfo         = NumberFormatter()
        numfo.numberStyle = .spellOut
        let number        = NSNumber(integerLiteral: number)
        
        return numfo.string(from: number) ?? "\(number)"
    }
}
