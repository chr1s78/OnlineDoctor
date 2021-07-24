//
//  DoctorCardPart.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/24.
//

import SwiftUI

struct DoctorCardPart: View {
    
    var doctorInfo: DoctorSimpleInfo
    
    var body: some View {
        ZStack {
            
            Color("main")
                .frame(width: 305, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 1)
            VStack(spacing: 15) {
                HStack {
                    Image("DoctorCard1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 53, height: 53)
                    
                    VStack(alignment: .leading) {
                        Text(doctorInfo.name)
                            .customFont(.subheadline)
                            .foregroundColor(.white)
                        Text(doctorInfo.type)
                            .customFont(.callout)
                            .foregroundColor(.white)
                        HStack {
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 10, height: 10)
                                .foregroundColor(.orange)
                            Text("\(doctorInfo.rating, specifier: "%.1f")")
                                .customFont(.callout)
                                .foregroundColor(.white)
                        }
                    }
                    
                    Spacer()
                    Image("map")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 104, height: 53)
                    
                }
                .frame(width: 265, height: 53)
                
                HStack {
                    Image(systemName: "text.bubble")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 12, height: 12)
                        .foregroundColor(.white)
                    
                    Text(doctorInfo.date, style: .date)
                        .foregroundColor(.white)
                    Text(",")
                        .foregroundColor(.white)
                    Text(doctorInfo.date, style: .time)
                        .foregroundColor(.white)
                }
                .customFont(.subheadline)
                .frame(width: 274, height: 52)
                .clipShape(RoundedRectangle(cornerRadius: 13))
                .background(Color("field").opacity(0.1))
            }
            .frame(width: 305)
        }
    }
}

