//
//  NotificationModel.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/23.
//

import Foundation

struct NotificationData: Identifiable, Codable {
    var id = UUID()
    let icon: String
    let title: String
    let content: String
    let time: String
}
