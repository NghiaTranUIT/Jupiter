//
//  EmptyURLService.swift
//  ZaloraJupiterCoreTests
//
//  Created by Nghia Tran on 12/2/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation
@testable import ZaloraJupiterCore

struct EmptyDeepURLScheme: DeepURLSchemeType {
    var urlType: DeepURLSchemeRoute { return .none }
}

class EmptyURLService: DeepURLServiceType {
    func handle(_ rawURL: String) -> DeepURLSchemeType{
        return EmptyDeepURLScheme()
    }
}
