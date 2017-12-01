//
//  Request+Default.swift
//  UberGoCore
//
//  Created by Nghia Tran on 9/13/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

import Alamofire
import Foundation

// MARK: - Default implementation
extension Request {

    var basePath: String { return Constants.ZaloraAPI.BaseProductionURL }

    var param: Parameter? { return nil }

    var isAuthenticated: Bool { return true }

    var addionalHeader: HeaderParameter? { return nil }

    var defaultHeader: HeaderParameter { return ["Accept": "application/json", "Accept-Language": "en_US"] }

    var urlPath: String { return basePath + endpoint }

    var url: URL { return URL(string: urlPath)! }

    var parameterEncoding: ParameterEncoding {
        if self.httpMethod == .get {
            return URLEncoding.default
        }
        return JSONEncoding.default
    }
}
