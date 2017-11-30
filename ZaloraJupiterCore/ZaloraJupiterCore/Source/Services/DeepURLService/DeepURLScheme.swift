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
    
    let country: String
    let gender: String
    let type: String
    let segment: String
    let shop: String
    let urlType: DeepURLSchemeType
}
