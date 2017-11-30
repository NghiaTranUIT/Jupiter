//
//  RouterType.swift
//  ZaloraJupiter
//
//  Created by NghiaTran on 11/30/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation
import ZaloraJupiterCore

enum RouterType {
    
    case home
    case pdv
    case catalog
    case menu
    case none
}

extension DeepURLSchemeType {
    
    func toRouter() -> RouterType {
        switch self {
        case .catalog:
            return .catalog
        case .home:
            return .home
        case .none:
            return .none
        }
    }
}
