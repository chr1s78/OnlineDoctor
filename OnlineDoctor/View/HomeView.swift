//
//  HomeView.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/19.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            
            NavigationLink("to other view", destination: SubHomeView())
                .navigationBarHidden(true)
        }
        .CustomNavigationButtonStyle()
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
