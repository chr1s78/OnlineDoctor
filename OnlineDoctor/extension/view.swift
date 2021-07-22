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
    
    func CustomNavigationButtonStyle() -> ModifiedContent<Self, CustomNavigationButton> {
        return modifier(CustomNavigationButton())
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

struct CustomNavigationButton: ViewModifier {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    func body(content: Content) -> some View {
        content
         //   .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.mode.wrappedValue.dismiss()
            }){
                Image("Back")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 38, height: 38, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 18, weight: .light))
                    .foregroundColor(Color.black)
            })
    }
}

/// Define the custom fonts to use, depending on the TextStyle.
typealias CustomFontDescription = (String, CGFloat)
private var fontDescriptions: [UIFont.TextStyle: CustomFontDescription] = [
    .title1: ("Montserrat", 30),
    .headline: ("Montserrat", 25),
    .subheadline: ("Montserrat", 12),
    .title2: ("Montserrat", 14),
    .title3: ("Montserrat", 18),
    .caption1: ("Montserrat", 5),
    .caption2: ("Montserrat", 8),
    .callout: ("Montserrat", 10),
]

//typealias CustomFontDescription = (String, CGFloat)
//private var fontWeight: [UIFont.Weight: CustomFontDescription] = [
//    .title1: ("Montserrat", 30),
//    .headline: ("Montserrat", 25),
//    .subheadline: ("Montserrat", 12),
//]

