//
//  MainViewModel.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/22.
//

import Foundation
import SwiftUI


class MainViewModel: ObservableObject {
    @Published var data = [DoctorSimpleInfo]()
    @Published var appointment = [UserAppointmentInfo]()
    @Published var appointDoctor = [DoctorSimpleInfo]()
    
    init() {
        data = [
            DoctorSimpleInfo(id: 1, photo: "Doctor1", rating: 4.9, experience: 8, name: "Dr.Samantha", type: "Cardiologist", address: ""),
            DoctorSimpleInfo(id: 2, photo: "Doctor2", rating: 4.85, experience: 10, name: "Dr.Daniel", type: "Dermatologist", address: ""),
            DoctorSimpleInfo(id: 3, photo: "Doctor1", rating: 4.9, experience: 7, name: "Dr.Fox", type: "Cardiologist", address: ""),
            DoctorSimpleInfo(id: 4, photo: "Doctor2", rating: 4.7, experience: 4, name: "Dr.Stephany", type: "Dermatologist", address: ""),
            DoctorSimpleInfo(id: 5, photo: "Doctor1", rating: 4.5, experience: 6, name: "Dr.Adrian", type: "Cardiologist", address: ""),
            DoctorSimpleInfo(id: 6, photo: "Doctor2", rating: 4.8, experience: 12, name: "Dr.Amuar", type: "Dermatologist", address: "")
        ]
        
        appointment = [
            UserAppointmentInfo(doctorID: 1, address: "Beijing", date: Date(timeIntervalSince1970: 40000)),
            UserAppointmentInfo(doctorID: 2, address: "Beijing", date: Date(timeIntervalSince1970: 50000)),
            UserAppointmentInfo(doctorID: 3, address: "Beijing", date: Date(timeIntervalSince1970: 60000))
        ]
        
        for app in appointment {
            let docid = app.doctorID
            for doc in data {
                if docid == doc.id {
                    appointDoctor.append(doc)
                }
            }
        }
        
    }
    
    
}
