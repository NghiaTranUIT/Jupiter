//
//  DeepURLService.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/30/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

protocol DeepURLServiceType {
    
    func handle(_ rawURL: String) -> DeepURLSchemeType
}

class DeepURLService: DeepURLServiceType {
    
    // MARK: Variable
    private let parser: DeepURLParserType
    
    // MARK: Init
    init(parser: DeepURLParserType) {
        self.parser = parser
    }
    
    class func `default`() -> DeepURLService {
        return DeepURLService(parser: DeepURLParse())
    }
    
    func handle(_ rawURL: String) -> DeepURLSchemeType{
        return parser.parse(with: rawURL)
    }
}

