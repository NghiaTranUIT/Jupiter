//
//  ZATeaser+Diffable.swift
//  ZaloraJupiter
//
//  Created by NghiaTran on 12/1/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation
import ZaloraJupiterCore
import IGListKit

extension ZATeaser: ListDiffable {
    
    public func diffIdentifier() -> NSObjectProtocol {
        return self.name as NSObjectProtocol
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? ZATeaser else { return false }
        return self.name == object.name
    }
}

class ZATeaserModel: ListDiffable {
    let teasers: [ZATeaser]
    
    init(teasers: [ZATeaser]) {
        self.teasers = teasers
    }
    
    public func diffIdentifier() -> NSObjectProtocol {
        return self.teasers as NSObjectProtocol
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let _ = object as? ZATeaserModel else { return false }
        return false
    }
}
