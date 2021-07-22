//
//  SearchBarView.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/22.
//

import SwiftUI

struct SearchBarView: View {
    
    var placeholder: String = "Search a doctor"
    @Binding var search: String
    
    var body: some View {
        ZStack {
            
            TextField(placeholder, text: $search)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(width: 246, height: 50, alignment: .leading)
                .offset(x: 60)
                .foregroundColor(.black)
                .background(
                    Color(#colorLiteral(red: 0.9254901961, green: 0.9490196078, blue: 1, alpha: 1))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                )
            
            Image(systemName: "magnifyingglass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .offset(x: -90)
            
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView( search: .constant(""))
    }
}
