//
//  FetchHomeProductRequest.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 12/1/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation
import Alamofire
import Unbox

struct FetchHomeProductRequestParameter: Parameter {
    
    let user: ZAUser
    
    func toDictionary() -> [String: Any] {
        return ["name": user.name]
    }
}

final class FetchHomeProductRequest: Request {
    
    // Type
    typealias Element = [ZAHomeScreenRowData]
    
    // Endpoint
    var endpoint: String { return Constants.ZaloraAPI.FetchHomeProduct }
    
    // HTTP
    var httpMethod: HTTPMethod { return .get }
    
    // Param
    var param: Parameter? { return self._param }
    fileprivate var _param: FetchHomeProductRequestParameter
    
    // MARK: - Init
    init(_ param: FetchHomeProductRequestParameter) {
        self._param = param
    }
    
    // MARK: - Decode
    func decode(data: Any) throws -> [ZAHomeScreenRowData]? {
        guard let result = data as? [String: Any],
            let data = result["data"] as? [[String: Any]] else {
                return nil
        }
        return try unbox(dictionaries: data)
    }
}
