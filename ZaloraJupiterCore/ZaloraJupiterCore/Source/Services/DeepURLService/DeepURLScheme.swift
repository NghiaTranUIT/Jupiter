//
//  DeepURLScheme.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/30/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

// Zalora://sg/urlc_s/m/products/?segment=women&shop=m"

public struct DeepURLScheme {
    
    public let country: String
    public let gender: String
    public let type: String
    public let segment: String
    public let shop: String
    public let urlType: DeepURLSchemeRoute
}
