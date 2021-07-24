//
//  RateAndExperience.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/24.
//

import SwiftUI

struct ExperiencePart: View {
    
    var experience: Int
    
    var body: some View {
        HStack(spacing: 5) {
            Image("experience")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 16)
                .lineLimit(1)
                .fixedSize(horizontal: true, vertical: true)
            
            VStack(alignment: .leading) {
                Text("experience")
                    .customFont(.caption1)
                Text("\(experience)" + " years+")
                    .fontWeight(.medium)
                    .customFont(.caption2)
                    // fixed text only 1 line , and display normal
                    .lineLimit(1)
                    .fixedSize(horizontal: true, vertical: true)
            }
        }
    }
}

struct RatePart: View {
    
    var rating: Double
    
    var body: some View {
        HStack(spacing: 5) {
            Image("rating")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 16)
            
            VStack(alignment: .leading) {
                Text("rating")
                    .customFont(.caption1)
                Text("\(rating, specifier: "%.1f")")
                    .bold()
                    .customFont(.caption2)
            }
        }
    }
}


