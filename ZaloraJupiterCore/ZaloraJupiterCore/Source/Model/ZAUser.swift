//
//  ZAUser.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 12/1/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

public class ZAUser {
    
    // MARK: - Static
    static let shared = ZAUser(name: "Nghia", gender: "_")
    
    // MARK: - Variable
    let name: String
    let gender: String
    let customerID: String
    
    // MARK: - Init
    init(name: String, gender: String) {
        self.name = name
        self.gender = gender
        customerID = UUID().uuidString
    }
}
