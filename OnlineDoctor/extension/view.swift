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
    /// title2      : font size 14
    /// title3      : font size 18
    /// caption1    : font size 5
    /// caption2    : font size 8
    /// callout     : font size 10
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



struct Delete: ViewModifier {
    
    let action: () -> Void
    
    @State var offset: CGSize = .zero
    @State var initialOffset: CGSize = .zero
    @State var contentWidth: CGFloat = 0.0
    @State var willDeleteIfReleased = false
   
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geometry in
                    ZStack {
                        Rectangle()
                            .foregroundColor(.red)
                        Image(systemName: "trash")
                            .foregroundColor(.white)
                            .font(.title2.bold())
                            .layoutPriority(-1)
                    }.frame(width: -offset.width)
                    .offset(x: geometry.size.width)
                    .onAppear {
                        contentWidth = geometry.size.width
                    }
                    .gesture(
                        TapGesture()
                            .onEnded {
                                delete()
                            }
                    )
                }
            )
            .offset(x: offset.width, y: 0)
            .gesture (
                DragGesture()
                    .onChanged { gesture in
                        if gesture.translation.width + initialOffset.width <= 0 {
                            self.offset.width = gesture.translation.width + initialOffset.width
                        }
                        if self.offset.width < -deletionDistance && !willDeleteIfReleased {
                            hapticFeedback()
                            willDeleteIfReleased.toggle()
                        } else if offset.width > -deletionDistance && willDeleteIfReleased {
                            hapticFeedback()
                            willDeleteIfReleased.toggle()
                        }
                    }
                    .onEnded { _ in
                        if offset.width < -deletionDistance {
                            delete()
                        } else if offset.width < -halfDeletionDistance {
                            offset.width = -tappableDeletionWidth
                            initialOffset.width = -tappableDeletionWidth
                        } else {
                            offset = .zero
                            initialOffset = .zero
                        }
                    }
            )
            .animation(.interactiveSpring())
    }
    
    private func delete() {
        offset.width = -contentWidth
        action()
    }
    
    private func hapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    //MARK: Constants
    
    let deletionDistance = CGFloat(200)
    let halfDeletionDistance = CGFloat(50)
    let tappableDeletionWidth = CGFloat(100)
    
    
}

extension View {
    
    func onDelete(perform action: @escaping () -> Void) -> some View {
        self.modifier(Delete(action: action))
    }
    
}
