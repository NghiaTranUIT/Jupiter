//
//  DeepURLParser.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/30/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

protocol DeepURLParserType {
    
    func parse(with rawURL: String) -> DeepURLScheme
}

class DeepURLParse: DeepURLParserType {
    
    func parse(with rawURL: String) -> DeepURLScheme {
        // Zalora://sg/urlc_s/m/products/?segment=women&shop=m"
        return DeepURLScheme(country: "sg", gender: "m", type: "products", segment: "women", shop: "m", urlType: .catalog)
    }
}
