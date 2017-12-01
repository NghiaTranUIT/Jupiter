//
//  HomeEmbeddedSectionController.swift
//  ZaloraJupiter
//
//  Created by NghiaTran on 12/1/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation
import IGListKit
import ZaloraJupiterCore

class HomeEmbeddedProductSectionController: ListSectionController {
    
    private var products: [ZAProduct]!
    
    override func numberOfItems() -> Int {
        return products.count
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "HomeProductViewCell", bundle: nil, for: self, at: index) as? HomeProductViewCell else {
            fatalError()
        }
        
        cell.config(products[index])
        return cell
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let height = collectionContext!.containerSize.height
        return CGSize(width: height, height: height)
    }
    
    override func didUpdate(to object: Any) {
        precondition(object is ZAProductModel)
        products = (object as! ZAProductModel).products
    }
}
