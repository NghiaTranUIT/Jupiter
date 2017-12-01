//
//  Product.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Unbox

public class ZAProduct: Unboxable {

    let name: String
    let url: String
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
    
    public required init(unboxer: Unboxer) throws {
        self.name = try unboxer.unbox(key: "name")
        self.url = try unboxer.unbox(key: "url")
    }
}
