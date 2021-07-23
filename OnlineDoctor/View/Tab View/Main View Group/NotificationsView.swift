//
//  NotificationsView.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/23.
//

import SwiftUI

struct NotificationsView: View {
    
    @StateObject var vm = NotificationViewModel()
    
    init() {
        // set navigation bar transparent
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = .clear
        UINavigationBar.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            Color("background").edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 15) {
                
                HStack {
                    Text("Today")
                        .fontWeight(.semibold)
                        .customFont(.title2)
                    Spacer()
                    Button(action: {
                        vm.RemoveToday()
                    }, label: {
                        Text("delete all")
                            .customFont(.subheadline)
                            .foregroundColor(.red)
                    })
                }
                .padding(.bottom, 24)
                
                ForEach(vm.today) { data in
                    NotificationRowView(day: data)
                }
                
                HStack {
                    Text("Today")
                        .fontWeight(.semibold)
                        .customFont(.title2)
                    Spacer()
                    Button(action: {
                        vm.RemoveYesterday()
                    }, label: {
                        Text("delete all")
                            .customFont(.subheadline)
                            .foregroundColor(.red)
                    })
                }
                .padding(.bottom, 24)
                
                ForEach(vm.yesterday) { data in
                    NotificationRowView(day: data)
                }
            }
            // 在 VStack 中的 Text 如果需要对齐，则需要设置VStack 的frame
            // 同时设置alignment
            .frame(width: UIScreen.main.bounds.width * 0.83, alignment: .leading)
         //   .background(Color.orange)
        }
        .navigationBarTitle("Notification", displayMode: .inline)
        .CustomNavigationButtonStyle()
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
        
    }
    
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
