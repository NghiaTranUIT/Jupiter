//
//  AnyRequest.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 12/1/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation
import Alamofire

class AnyRequest<T: Request>: Request {
    
    private let request: T
    
    var endpoint: String { return request.endpoint }
    
    var httpMethod: HTTPMethod { return request.httpMethod }
    
    func decode(data: Any) throws -> T.Element? {
        return try request.decode(data: data)
    }
    
    init(_ request: T) {
        self.request = request
    }
}
