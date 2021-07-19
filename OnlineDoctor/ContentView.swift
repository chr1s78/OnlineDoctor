//
//  ContentView.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/19.
//

import SwiftUI

struct ContentView: View {
    @State private var onboardinDone = false
    var data = OnboardingDataModel.data
    
    var body: some View {
        Group {
            if !onboardinDone {
                OnboardingViewPure(data: data, doneFunction: {
                    /// Update your state here
                    self.onboardinDone = true
                    print("done onboarding")
                })
            } else {
                SignInView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
