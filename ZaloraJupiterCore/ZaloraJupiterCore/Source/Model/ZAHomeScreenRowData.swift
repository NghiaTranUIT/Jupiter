//
//  HomeScreenRowData.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Unbox

public class ZAHomeScreenRowData: Unboxable {
    
    public enum RowType {
        case Teaser
        case DataJet
    }
    
    private let endpoint: String
    public let uuid: String
    public let products: [ZAProduct]
    public let teasers: [ZATeaser]
    public let title: String
    public var type: RowType {
        if products.count > 0 { return .DataJet }
        return .Teaser
    }
    
    public init(endpoint: String, title: String, products: [ZAProduct], teasers: [ZATeaser]) {
        self.endpoint = endpoint
        self.products = products
        self.teasers = teasers
        self.uuid = UUID().uuidString
        self.title = title
    }
    
    public required init(unboxer: Unboxer) throws {
        self.endpoint = try unboxer.unbox(key: "endpoint")
        self.products = try unboxer.unbox(key: "products")
        self.teasers = try unboxer.unbox(key: "teasers")
        self.uuid = try unboxer.unbox(key: "uuid")
        self.title = try unboxer.unbox(key: "title")
    }
}

extension ZAHomeScreenRowData: Equatable {
    public static func ==(lhs: ZAHomeScreenRowData, rhs: ZAHomeScreenRowData) -> Bool {
        return lhs.endpoint == rhs.endpoint &&
            lhs.products.count == rhs.products.count &&
            lhs.teasers.count == rhs.teasers.count
    }
}
