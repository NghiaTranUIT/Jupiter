//
//  Request.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 12/1/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation
import Alamofire

typealias HeaderParameter = [String: String]
typealias JSONDictionary = [String: Any]

// MARK: - Request protocol
protocol Request: URLRequestConvertible {
    
    associatedtype Element
    
    var basePath: String { get }
    
    var endpoint: String { get }
    
    var httpMethod: HTTPMethod { get }
    
    var param: Parameter? { get }
    
    var addionalHeader: HeaderParameter? { get }
    
    var isAuthenticated: Bool { get }
    
    func decode(data: Any) throws -> Element?
}
