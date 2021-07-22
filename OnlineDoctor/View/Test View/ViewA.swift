//
//  ViewA.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/22.
//

import SwiftUI

struct ViewA: View {
    var body: some View {
        NavigationView {
            
            VStack {
                Text("View A")
                
                NavigationLink("to View B", destination: ViewB())
                
            }
            .navigationBarHidden(true)
            .CustomNavigationButtonStyle()
           
        }
    }
}

struct ViewA_Previews: PreviewProvider {
    static var previews: some View {
        ViewA()
    }
}
