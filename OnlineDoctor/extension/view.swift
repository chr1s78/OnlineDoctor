//
//  view.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/19.
//

import SwiftUI

extension View {
    
    /// Converts a Double into a Currency with 2 decimal places
    /// ```
    /// title1      : font size 30
    /// headline    : font size 25
    /// subheadline : font size 12
    /// ```
    func customFont(_ textStyle: UIFont.TextStyle) -> ModifiedContent<Self, CustomFont> {
        return modifier(CustomFont(textStyle: textStyle))
    }
}



struct CustomFont: ViewModifier {
    let textStyle: UIFont.TextStyle

    /// Will trigger the refresh of the view when the ContentSizeCategory changes.
    @Environment(\.sizeCategory) var sizeCategory: ContentSizeCategory

    func body(content: Content) -> some View {

        guard let fontDescription = fontDescriptions[textStyle] else {

            print("textStyle nicht vorhanden: \(textStyle)")

            return content.font(.system(.body));
        }

        let fontMetrics = UIFontMetrics(forTextStyle: textStyle)
        let fontSize = fontMetrics.scaledValue(for: fontDescription.1)

        return content.font(.custom(fontDescription.0, size: fontSize))
    }
}

/// Define the custom fonts to use, depending on the TextStyle.
typealias CustomFontDescription = (String, CGFloat)
private var fontDescriptions: [UIFont.TextStyle: CustomFontDescription] = [
    .title1: ("Montserrat", 30),
    .headline: ("Montserrat", 25),
    .subheadline: ("Montserrat", 12),
]

//typealias CustomFontDescription = (String, CGFloat)
//private var fontWeight: [UIFont.Weight: CustomFontDescription] = [
//    .title1: ("Montserrat", 30),
//    .headline: ("Montserrat", 25),
//    .subheadline: ("Montserrat", 12),
//]

