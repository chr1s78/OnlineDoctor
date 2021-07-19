//
//  OnboardingModel.swift
//  Onboarding
//
//  Created by Augustinas Malinauskas on 06/07/2020.
//  Copyright © 2020 Augustinas Malinauskas. All rights reserved.
//

import Foundation

struct OnboardingDataModel {
    var image: String
    var heading: String
    var text: String
}

extension OnboardingDataModel {
    static var data: [OnboardingDataModel] = [
        OnboardingDataModel(image: "onboarding-1", heading: "Easy consulation with a doctor in your pocket", text: "A complete health app that allows customers to get diagnosed via there phone."),
        OnboardingDataModel(image: "onboarding-1", heading: "Easy consulation with a doctor in your pocket", text: "A complete health app that allows customers to get diagnosed via there phone."),
        OnboardingDataModel(image: "onboarding-1", heading: "Easy consulation with a doctor in your pocket", text: "A complete health app that allows customers to get diagnosed via there phone."),
        OnboardingDataModel(image: "onboarding-1", heading: "Easy consulation with a doctor in your pocket", text: "A complete health app that allows customers to get diagnosed via there phone."),
        OnboardingDataModel(image: "onboarding-1", heading: "Easy consulation with a doctor in your pocket", text: "A complete health app that allows customers to get diagnosed via there phone."),
    ]
}
