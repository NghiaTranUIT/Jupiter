//
//  JSONFetcher.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 12/1/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

class JSONFetcher: NetworkFetchable {
    
    func get<T>(_ request: AnyRequest<T>) -> T.Element {
        switch request.endpoint {
        case Constants.ZaloraAPI.FetchHomeProduct:
            
            // Json
            let path = Bundle(for: JSONFetcher.self).url(forResource: "FetchHomeProductSample", withExtension: "json")!
            let data = try! Data(contentsOf: path)
            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
            return try! request.decode(data: json)!
        default:
            fatalError()
        }
    }
}


