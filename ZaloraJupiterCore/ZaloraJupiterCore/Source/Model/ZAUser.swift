//
//  ZAUser.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 12/1/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

public class ZAUser {
    
    static let shared = ZAUser(name: "Nghia", gender: "_")
    
    let name: String
    let gender: String
    
    init(name: String, gender: String) {
        self.name = name
        self.gender = gender
    }
}
