//
//  ViewB.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/22.
//

import SwiftUI

struct ViewB: View {
    var body: some View {
        VStack {
            Text("View B")
            
            NavigationLink("to View C", destination: ViewB())
            
        }
        .CustomNavigationButtonStyle()
    }
}

struct ViewB_Previews: PreviewProvider {
    static var previews: some View {
        ViewB()
    }
}
