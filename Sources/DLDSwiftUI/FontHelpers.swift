//
//  File.swift
//  
//
//  Created by Dionne Lie-Sam-Foek on 29/12/2020.
//

import SwiftUI

public extension Font {
    /// Gets a system font with the given style, design, weight and optionally in italics.
    /// - Parameters:
    ///   - style: The dynamic text style for the font.
    ///   - design: The design to use for the font.
    ///   - weight: The weight of the font.
    ///   - italic: Whether or not to add italics to the font.
    private static func system(_ style: TextStyle, design: Design, weight: Weight, italic: Bool = false) -> Font {
        let sf = system(style, design: design).weight(weight)
        return italic ? sf.italic() : sf
    }
    
    // MARK: - Rounded
    /// Gets a system font with the given text style and the given weight in the rounded design.
    /// - Parameters:
    ///   - style: The dynamic text style to use. Default is `body`.
    ///   - weight: The weight of the font. Default is `regular`.
    static func rounded(_ style: TextStyle = .body, weight: Weight = .regular) -> Font {
        system(style, design: .rounded, weight: weight)
    }
    
    // MARK: - Rounded Bold
    /// Gets a system font with the given text style in the bold weight with a rounded design.
    ///   - style: The dynamic text style to use. Default is `body`.
    static func roundedBold(_ style: TextStyle = .body) -> Font {
        system(style, design: .rounded, weight: .bold)
    }
    
    // MARK: - Italic
    /// Gets a system font with the given text style and the given weight in italics.
    /// - Parameters:
    ///   - style: The dynamic text style to use. Default is `body`.
    ///   - weight: The weight of the font. Default is `regular`.
    static func italic(_ style: TextStyle = .body, weight: Weight = .regular) -> Font {
        system(style, design: .default, weight: weight, italic: true)
    }
    
    // MARK: - Large Title
    // ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    /// Gets a system font with a large title text style and the given weight, design and italic specifications.
    /// - Parameters:
    ///   - weight: The weight of the font. Default is `regular`.
    ///   - design: The design of the font. Default is `default`.
    ///   - italic: Set to `true` to add italics to the font. Default is `false`.
    static func largeTitle(weight: Weight = .regular, design: Design = .default, italic: Bool = false) -> Font {
        system(.largeTitle, design: design, weight: weight, italic: italic)
    }
    /// Gets a system font with a large title text style and the given weight, and design specifications.
    /// - Parameters:
    ///   - weight: The weight of the font.
    ///   - design: The design of the font. Default is `default`.
    static func largeTitle(weight: Weight, design: Design = .default) -> Font {
        largeTitle(weight: weight, design: design, italic: false)
    }
    
    // MARK: - Title
    // ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    /// Gets a system font with a title text style and the given weight, design and italic specifications.
    /// - Parameters:
    ///   - weight: The weight of the font. Default is `regular`.
    ///   - design: The design of the font. Default is `default`.
    ///   - italic: Set to `true` to add italics to the font. Default is `false`.
    static func title(weight: Weight = .regular, design: Design = .default, italic: Bool = false) -> Font {
        system(.title, design: design, weight: weight, italic: italic)
    }
    /// Gets a system font with a title text style and the given weight, and design specifications.
    /// - Parameters:
    ///   - weight: The weight of the font.
    ///   - design: The design of the font. Default is `default`.
    static func title(weight: Weight, design: Design = .default) -> Font {
        title(weight: weight, design: design, italic: false)
    }
    
    // MARK: - Title 2
    // ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    /// Gets a system font with a second level hierarchical heading text style and the given weight, design and italic specifications.
    /// - Parameters:
    ///   - weight: The weight of the font. Default is `regular`.
    ///   - design: The design of the font. Default is `default`.
    ///   - italic: Set to `true` to add italics to the font. Default is `false`.
    static func title2(weight: Weight = .regular, design: Design = .default, italic: Bool = false) -> Font {
        system(.title2, design: design, weight: weight, italic: italic)
    }
    /// Gets a system font with a second level hierarchical heading text style and the given weight, and design specifications.
    /// - Parameters:
    ///   - weight: The weight of the font.
    ///   - design: The design of the font. Default is `default`.
    static func title2(weight: Weight, design: Design = .default) -> Font {
        title2(weight: weight, design: design, italic: false)
    }
    
    // MARK: - Title 3
    // ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    /// Gets a system font with a third level hierarchical heading text style and the given weight, design and italic specifications.
    /// - Parameters:
    ///   - weight: The weight of the font. Default is `regular`.
    ///   - design: The design of the font. Default is `default`.
    ///   - italic: Set to `true` to add italics to the font. Default is `false`.
    static func title3(weight: Weight = .regular, design: Design = .default, italic: Bool = false) -> Font {
        system(.title3, design: design, weight: weight, italic: italic)
    }
    /// Gets a system font with a third level hierarchical heading text style and the given weight, and design specifications.
    /// - Parameters:
    ///   - weight: The weight of the font.
    ///   - design: The design of the font. Default is `default`.
    static func title3(weight: Weight, design: Design = .default) -> Font {
        title3(weight: weight, design: design, italic: false)
    }
    
    // MARK: - Headline
    // ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    /// Gets a system font with a headline text style and the given weight, design and italic specifications.
    /// - Parameters:
    ///   - weight: The weight of the font. Default is `regular`.
    ///   - design: The design of the font. Default is `default`.
    ///   - italic: Set to `true` to add italics to the font. Default is `false`.
    static func headline(weight: Weight = .regular, design: Design = .default, italic: Bool = false) -> Font {
        system(.headline, design: design, weight: weight, italic: italic)
    }
    /// Gets a system font with a headline text style and the given weight, and design specifications.
    /// - Parameters:
    ///   - weight: The weight of the font.
    ///   - design: The design of the font. Default is `default`.
    static func headline(weight: Weight, design: Design = .default) -> Font {
        headline(weight: weight, design: design, italic: false)
    }
    
    // MARK: - Subheadline
    // ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    /// Gets a system font with a subheadline text style and the given weight, design and italic specifications.
    /// - Parameters:
    ///   - weight: The weight of the font. Default is `regular`.
    ///   - design: The design of the font. Default is `default`.
    ///   - italic: Set to `true` to add italics to the font. Default is `false`.
    static func subheadline(weight: Weight = .regular, design: Design = .default, italic: Bool = false) -> Font {
        system(.subheadline, design: design, weight: weight, italic: italic)
    }
    /// Gets a system font with a subheadline text style and the given weight, and design specifications.
    /// - Parameters:
    ///   - weight: The weight of the font.
    ///   - design: The design of the font. Default is `default`.
    static func subheadline(weight: Weight, design: Design = .default) -> Font {
        subheadline(weight: weight, design: design, italic: false)
    }
    
    // MARK: - Body
    // ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    /// Gets a system font with a body text style and the given weight, design and italic specifications.
    /// - Parameters:
    ///   - weight: The weight of the font. Default is `regular`.
    ///   - design: The design of the font. Default is `default`.
    ///   - italic: Set to `true` to add italics to the font. Default is `false`.
    static func body(weight: Weight = .regular, design: Design = .default, italic: Bool = false) -> Font {
        system(.body, design: design, weight: weight, italic: italic)
    }
    /// Gets a system font with a body text style and the given weight, and design specifications.
    /// - Parameters:
    ///   - weight: The weight of the font.
    ///   - design: The design of the font. Default is `default`.
    static func body(weight: Weight, design: Design = .default) -> Font {
        body(weight: weight, design: design, italic: false)
    }
    
    // MARK: - Callout
    // ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    /// Gets a system font with a callout text style and the given weight, design and italic specifications.
    /// - Parameters:
    ///   - weight: The weight of the font. Default is `regular`.
    ///   - design: The design of the font. Default is `default`.
    ///   - italic: Set to `true` to add italics to the font. Default is `false`.
    static func callout(weight: Weight = .regular, design: Design = .default, italic: Bool = false) -> Font {
        system(.callout, design: design, weight: weight, italic: italic)
    }
    /// Gets a system font with a callout text style and the given weight, and design specifications.
    /// - Parameters:
    ///   - weight: The weight of the font.
    ///   - design: The design of the font. Default is `default`.
    static func callout(weight: Weight, design: Design = .default) -> Font {
        callout(weight: weight, design: design, italic: false)
    }
    
    // MARK: - Footnote
    // ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    /// Gets a system font with a footnote text style and the given weight, design and italic specifications.
    /// - Parameters:
    ///   - weight: The weight of the font. Default is `regular`.
    ///   - design: The design of the font. Default is `default`.
    ///   - italic: Set to `true` to add italics to the font. Default is `false`.
    static func footnote(weight: Weight = .regular, design: Design = .default, italic: Bool = false) -> Font {
        system(.footnote, design: design, weight: weight, italic: italic)
    }
    /// Gets a system font with a footnote text style and the given weight, and design specifications.
    /// - Parameters:
    ///   - weight: The weight of the font.
    ///   - design: The design of the font. Default is `default`.
    static func footnote(weight: Weight, design: Design = .default) -> Font {
        footnote(weight: weight, design: design, italic: false)
    }
    
    // MARK: - Caption
    // ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    /// Gets a system font with a caption text style and the given weight, design and italic specifications.
    /// - Parameters:
    ///   - weight: The weight of the font. Default is `regular`.
    ///   - design: The design of the font. Default is `default`.
    ///   - italic: Set to `true` to add italics to the font. Default is `false`.
    static func caption(weight: Weight = .regular, design: Design = .default, italic: Bool = false) -> Font {
        system(.caption, design: design, weight: weight, italic: italic)
    }
    /// Gets a system font with a caption text style and the given weight, and design specifications.
    /// - Parameters:
    ///   - weight: The weight of the font.
    ///   - design: The design of the font. Default is `default`.
    static func caption(weight: Weight, design: Design = .default) -> Font {
        caption(weight: weight, design: design, italic: false)
    }
    
    // MARK: - Caption 2
    // ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    /// Gets a system font with an alternate caption text style and the given weight, design and italic specifications.
    /// - Parameters:
    ///   - weight: The weight of the font. Default is `regular`.
    ///   - design: The design of the font. Default is `default`.
    ///   - italic: Set to `true` to add italics to the font. Default is `false`.
    static func caption2(weight: Weight = .regular, design: Design = .default, italic: Bool = false) -> Font {
        system(.caption2, design: design, weight: weight, italic: italic)
    }
    /// Gets a system font with an alternate caption text style and the given weight, and design specifications.
    /// - Parameters:
    ///   - weight: The weight of the font.
    ///   - design: The design of the font. Default is `default`.
    static func caption2(weight: Weight, design: Design = .default) -> Font {
        caption2(weight: weight, design: design, italic: false)
    }
}
