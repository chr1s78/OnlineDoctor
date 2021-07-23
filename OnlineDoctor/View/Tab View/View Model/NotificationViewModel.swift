//
//  NotificationViewModel.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/23.
//

import Foundation

class NotificationViewModel: ObservableObject {
    @Published var today = [NotificationData]()
    @Published var yesterday = [NotificationData]()
    
    init() {
        today.append(NotificationData(icon: "reminder", title: "Reminders Set for Appointment", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Augue morbi vulputate enim interdum felis.", time: "1 minute ago"))
        today.append(NotificationData(icon: "Appoint", title: "Appointment Set for Tomorrow", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Augue morbi vulputate enim interdum felis.", time: "5 minute ago"))
        today.append(NotificationData(icon: "Nofitication", title: "Nofitication from Dr.Samantha", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Augue morbi vulputate enim interdum felis.", time: "32 minute ago"))
        
        yesterday.append(NotificationData(icon: "Cancelled", title: "Reminders Set for Appointment", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Augue morbi vulputate enim interdum felis.", time: "02.00 pm"))
        yesterday.append(NotificationData(icon: "Appoint", title: "Appointment Set for Tomorrow", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Augue morbi vulputate enim interdum felis.", time: "10.00 am"))
    }
    
    func RemoveTodayAt(index: IndexSet) {
        today.remove(atOffsets: index)
    }
    
    func RemoveTodayAt(index: Int) {
        today.remove(at: index)
    }
    
    func RemoveTodayContent(content: NotificationData) {
        
    }
    
    func RemoveToday() {
        today.removeAll()
    }
    
    func RemoveYesterday() {
        yesterday.removeAll()
    }
}
