//
//  ZATeaser.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Unbox

public class ZATeaser: Unboxable {
    
    public let name: String
    public let url: String
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
    
    public required init(unboxer: Unboxer) throws {
        self.name = try unboxer.unbox(key: "name")
        self.url = try unboxer.unbox(key: "url")
    }
}

extension ZATeaser: Equatable {
    
    public static func ==(lhs: ZATeaser, rhs: ZATeaser) -> Bool {
        return lhs.name == rhs.name && lhs.url == rhs.url
    }
}
