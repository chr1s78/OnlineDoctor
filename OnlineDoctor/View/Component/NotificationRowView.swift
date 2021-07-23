//
//  NotificationRowView.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/23.
//

import SwiftUI

struct NotificationRowView: View {
    
    @EnvironmentObject var vm: NotificationViewModel
    var day: NotificationData
    
    var width: CGFloat = 305
    var height: CGFloat = 74
    
    var body: some View {
        
        ZStack {
            
            // background color
            Color("field")
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            // content
            HStack(alignment: .top, spacing: 1.0) {
                Image(day.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                
                VStack(alignment: .leading, spacing: 3.0) {
                    Text(day.title)
                        .fontWeight(.semibold)
                        .customFont(.callout)
                    Text(day.content)
                        .customFont(.caption2)
                    Text(day.time)
                        .customFont(.caption2)
                        .foregroundColor(.gray)
                        .padding(.top, 8)
                }
                .frame(width: width * 0.75)
                
                Spacer()
            }
            .frame(maxWidth: width)
            .padding(.leading, 16)
        }
    }
}

struct NotificationRowView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationRowView(day: NotificationData(icon: "reminder", title: "Reminders Set for Appointment", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Augue morbi vulputate enim interdum felis.", time: "1 minute ago")).environmentObject(NotificationViewModel())
    }
}
