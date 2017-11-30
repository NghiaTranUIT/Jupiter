//
//  NetworkService.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {}

typealias NetworkServiceType = NetworkServiceProtocol & NetworkServiceHome & NetworkServiceMenu

class NetworkService: NetworkServiceType {
    
}

extension NetworkService {
    
    func fetchHomeProduct(_ completion: ([ZAHomeScreenRowData]) -> Void) {
        
    }
}

extension NetworkService {
    func fetchMenu(_ completion: () -> Void) {
        
    }
}
