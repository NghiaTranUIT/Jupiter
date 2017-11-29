//
//  HomeScreenRowData.swift
//  ZaloraJupiter
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation
import ZaloraJupiterCore
import IGListKit

extension ZAHomeScreenRowData: ListDiffable {
    
    public func diffIdentifier() -> NSObjectProtocol {
        return self.uuid as NSObjectProtocol
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? ZAHomeScreenRowData else { return false }
        return self.type == object.type
    }
}
