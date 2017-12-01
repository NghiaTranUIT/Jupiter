//
//  ZAProduct+ListDiffable.swift
//  ZaloraJupiter
//
//  Created by NghiaTran on 12/1/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation
import ZaloraJupiterCore
import IGListKit

extension ZAProduct: ListDiffable {
    
    public func diffIdentifier() -> NSObjectProtocol {
        return self.name as NSObjectProtocol
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? ZAProduct else { return false }
        return self.name == object.name
    }
}

class ZAProductModel: ListDiffable {
    let products: [ZAProduct]
    
    init(products: [ZAProduct]) {
        self.products = products
    }
    
    public func diffIdentifier() -> NSObjectProtocol {
        return self.products as NSObjectProtocol
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let _ = object as? ZAProductModel else { return false }
        return false
    }
}

