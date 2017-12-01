//
//  HomeEmbeddedTeaserSectionController.swift
//  ZaloraJupiter
//
//  Created by NghiaTran on 12/1/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation
import IGListKit
import ZaloraJupiterCore

class HomeEmbeddedTeaserSectionController: ListSectionController {
    
    private var teasers: [ZATeaser]!
    
    override func numberOfItems() -> Int {
        return teasers.count
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "HomeTeaserViewCell", bundle: nil, for: self, at: index) as? HomeTeaserViewCell else {
            fatalError()
        }
        
        cell.config(teasers[index])
        return cell
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let height = collectionContext!.containerSize.height
        return CGSize(width: height, height: height)
    }
    
    override func didUpdate(to object: Any) {
        precondition(object is ZATeaserModel)
        teasers = (object as! ZATeaserModel).teasers
    }
}
