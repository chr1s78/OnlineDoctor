//
//  TextFieldButton.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/19.
//

import SwiftUI

struct TextFieldClearButton: ViewModifier {
    @Binding var text: String
    @Binding var showPassword: Bool
    
    func body(content: Content) -> some View {
        HStack {
            content
            Spacer()
            if !text.isEmpty {
                Button(
                    action: { self.showPassword.toggle() },
                    label: {
                        Image(systemName: "eye.slash")
                            .foregroundColor(Color(UIColor.opaqueSeparator))
                            .offset(x: -14)
                    }
                )
                .padding(.trailing, 30)
            }
        }
       // .fixedSize(horizontal: true, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
}


