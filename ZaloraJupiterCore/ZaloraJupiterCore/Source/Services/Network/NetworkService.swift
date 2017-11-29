//
//  NetworkService.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
    
}

protocol NetworkServiceHome {
    
    func fetchHomeProduct(completion: EmptyBlock, fail: EmptyBlock)
}

class NetworkService: NetworkServiceProtocol {
    
}

extension NetworkService: NetworkServiceHome {
    
    func fetchHomeProduct(completion: EmptyBlock, fail: EmptyBlock) {
        
    }
}
