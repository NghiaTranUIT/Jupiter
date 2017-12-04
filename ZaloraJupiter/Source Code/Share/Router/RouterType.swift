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
    
    case home(DeepURLSchemeType?)
    case pdv(DeepURLSchemeType?)
    case catalog(DeepURLSchemeType?)
    case menu(DeepURLSchemeType?)
    case none
    
    init(scheme: DeepURLSchemeType) {
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
