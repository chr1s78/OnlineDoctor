//
//  TestView.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/20.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        NavigationView {
            NavigationLink("To", destination: VerficationView()
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true))
        }
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
