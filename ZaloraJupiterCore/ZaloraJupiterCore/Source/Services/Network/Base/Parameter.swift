//
//  Parameter.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 12/1/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

// MARK: - Generic param
protocol Parameter {
    
    // Convert to dictionary
    // work seamless with Alamofire
    func toDictionary() -> [String: Any]
}
