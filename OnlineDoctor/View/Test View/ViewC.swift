//
//  ViewC.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/22.
//

import SwiftUI

struct ViewC: View {
    var body: some View {
        VStack {
            VStack {
                Text("View C")
                
                VStack {
                    NavigationLink("to View D", destination: ViewB().navigationBarHidden(true))
                }
            }
            .CustomNavigationButtonStyle()
        }
    }
}

struct ViewC_Previews: PreviewProvider {
    static var previews: some View {
        ViewC()
    }
}
