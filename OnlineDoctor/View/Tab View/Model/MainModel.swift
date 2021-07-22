//
//  MainModel.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/22.
//

import Foundation

struct DoctorSimpleInfo: Identifiable, Codable {
    var id: Int
    let photo: String
    let rating: Double
    let experience: Int
    let name: String
    let type: String
}

struct UserAppointmentInfo: Identifiable, Codable {
    var id = UUID()
    let doctorID: Int
    let address: String
    let date: Date
}
