//
//  VerifyCodeField.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/20.
//

import SwiftUI
import SwiftUIX

struct VerifyCodeField: View {
    
    var index: Int
    @Binding var fIndex: (String, Bool)
    
    var body: some View {
        CocoaTextField("", text: $fIndex.0)
            .foregroundColor(Color(#colorLiteral(red: 0.3450980392, green: 0.3607843137, blue: 0.8980392157, alpha: 1)))
            .isInitialFirstResponder(index==0 ? true : false)
            .isFirstResponder(fIndex.1)
            .frame(width: 69, height: 50)
            .multilineTextAlignment(.center)
            .background(Color(#colorLiteral(red: 0.9254901961, green: 0.9490196078, blue: 1, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .onChange(of: fIndex.0, perform: { value in
                print("onChange: value \(value)" + fIndex.1.description)
                if value.count >= 1 {
                    fIndex.1.toggle()
                }
            })
            .onTapGesture(perform: {
                fIndex.1 = true
                if fIndex.0 != "" {
                    fIndex.0 = ""
                }
            })
    }
}

struct VerifyCodeField_Previews: PreviewProvider {
    static var previews: some View {
        VerifyCodeField(index: 0, fIndex: .constant(("", false)))
    }
}
