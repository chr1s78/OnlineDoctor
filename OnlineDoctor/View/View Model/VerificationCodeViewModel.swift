//
//  VerificationCodeViewModel.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/21.
//

import Foundation
import SwiftUI

class FieldViewModel: ObservableObject {
    @Published var f1: (String, Bool) = ("", false) {
        didSet {
            print("f1 set " + f1.1.description)
            print("f1 oldvalue " + oldValue.1.description)
            
            f2.1 = oldValue.1 && !(f1.1)
        }
    }
    @Published var f2: (String, Bool) = ("", false) {
        didSet {
            print("f2 set " + f2.1.description)
            print("f2 oldvalue " + oldValue.1.description)
            f3.1 = oldValue.1 && !(f2.1)
        }
    }
    @Published var f3: (String, Bool) = ("", false) {
        didSet {
            print("f3 set " + f3.1.description)
            f4.1 = oldValue.1 && !(f3.1)
        }
    }
    @Published var f4: (String, Bool) = ("", false) {
        didSet {
            print("f4 set " + f4.1.description)

        }
    }
    
    var code: String {
        return f1.0 + f2.0 + f3.0 + f4.0
    }
}
