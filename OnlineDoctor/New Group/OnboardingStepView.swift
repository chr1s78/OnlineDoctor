//
//  OnboardingStepView.swift
//  Onboarding
//
//  Created by Augustinas Malinauskas on 06/07/2020.
//  Copyright © 2020 Augustinas Malinauskas. All rights reserved.
//

import SwiftUI

struct OnboardingStepView: View {
    var data: OnboardingDataModel
    
    var body: some View {
        VStack(spacing: 2.0) {
            Image(data.image)
                .resizable()
                .scaledToFit()
                .padding(.bottom, 30)
            
            VStack(alignment: .leading) {
                Text(data.heading)
                    .bold()
                    .customFont(.title1)
                    .padding(.bottom, 10)
                    
                Text(data.text)
                    .fontWeight(.light)
                    .customFont(.subheadline)
                    .multilineTextAlignment(.leading)
            }
            .frame(width: 288)
            .offset(x: -25)
            
           
            Spacer()
        }
        .padding()
       // .edgesIgnoringSafeArea(.all)
    }
}

struct OnboardingStepView_Previews: PreviewProvider {
    static var data = OnboardingDataModel.data[0]
    static var previews: some View {
        OnboardingStepView(data: data)
    }
}
