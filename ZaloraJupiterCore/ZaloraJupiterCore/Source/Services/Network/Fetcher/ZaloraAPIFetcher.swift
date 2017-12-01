//
//  NetworkFetcher.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 12/1/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

class ZaloraAPIFetcher: NetworkFetchable {
    
    func get<T>(_ request: AnyRequest<T>) -> T.Element {
        
        // Reuse iOSNetworking - Zalora framework here
        fatalError()
    }
}
