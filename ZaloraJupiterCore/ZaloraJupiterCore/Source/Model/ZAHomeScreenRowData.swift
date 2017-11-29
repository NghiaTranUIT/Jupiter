//
//  HomeScreenRowData.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

public class ZAHomeScreenRowData {
    
    public enum RowType {
        case Teaser
        case DataJet
    }
    
    private let endpoint: String
    private let param: [String: Any]
    
    public let uuid: String
    public let products: [ZAProduct]
    public let teasers: [ZATeaser]
    public let type = RowType.DataJet
    
    init(endpoint: String, param: [String: Any], products: [ZAProduct], teasers: [ZATeaser]) {
        self.endpoint = endpoint
        self.param = param
        self.products = products
        self.teasers = teasers
        self.uuid = UUID().uuidString
    }
}

extension ZAHomeScreenRowData: Equatable {
    public static func ==(lhs: ZAHomeScreenRowData, rhs: ZAHomeScreenRowData) -> Bool {
        return lhs.endpoint == rhs.endpoint &&
            lhs.products.count == rhs.products.count &&
            lhs.teasers.count == rhs.teasers.count
    }
}
