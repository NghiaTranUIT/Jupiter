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
    
    // MARK: Variable
    fileprivate var fetcher: NetworkFetchable
    
    // MARK: Init
    init(fetcher: NetworkFetchable) {
        self.fetcher = fetcher
    }
    
    class func `default`() -> NetworkService {
        return NetworkService(fetcher: NetworkFetcher())
    }
}

extension NetworkService {
    
    func fetchHomeProduct(_ completion: ([ZAHomeScreenRowData]) -> Void) {
        let param = FetchHomeProductRequestParameter(user: ZAUser.shared)
        let request = AnyRequest(FetchHomeProductRequest(param))
        fetcher.get(request)
    }
}

extension NetworkService {
    func fetchMenu(_ completion: () -> Void) {
        
    }
}
