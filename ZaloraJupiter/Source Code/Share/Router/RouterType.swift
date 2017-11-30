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
    
    case home(DeepURLScheme?)
    case pdv(DeepURLScheme?)
    case catalog(DeepURLScheme?)
    case menu(DeepURLScheme?)
    case none
    
    init(scheme: DeepURLScheme) {
        switch scheme.urlType {
        case .catalog:
            self = .catalog(scheme)
            break
        case .home:
            self = .home(scheme)
            break
        case .none:
            self = .none
            break
        }
    }
}
