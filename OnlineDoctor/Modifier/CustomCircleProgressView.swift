//
//  CustomCircleProgressView.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/20.
//

import SwiftUI

struct CustomCircularProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: CGFloat(configuration.fractionCompleted ?? 0))
                .stroke(Color.green, style: StrokeStyle(lineWidth: 3, dash: [10, 5]))
                .rotationEffect(.degrees(-90))
                .frame(width: 124)
            
            if let fractionCompleted = configuration.fractionCompleted {
                Text(fractionCompleted < 1 ?
                        ""
                        : "Success!"
                )
                .fontWeight(.heavy)
                .foregroundColor(fractionCompleted < 1 ? .white : .white)
                .frame(width: 180)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

