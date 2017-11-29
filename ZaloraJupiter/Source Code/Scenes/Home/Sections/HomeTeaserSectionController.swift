
//
//  HomeTeaserSectionController.swift
//  ZaloraJupiter
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation
import IGListKit
import ZaloraJupiterCore

class HomeTeaserSectionController: ListSectionController {
    
    private var rowData: ZAHomeScreenRowData!
    
    override init() {
        super.init()
        self.supplementaryViewSource = self
    }
    
    override func numberOfItems() -> Int {
        return rowData.teasers.count
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "HomeTeaserRowViewCell", bundle: nil, for: self, at: index) as? HomeTeaserRowViewCell else {
            fatalError()
        }
        
        let teasers = rowData.teasers
        cell.configure(with: teasers)
        
        return cell
    }

    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 88.0)
    }
    
    override func didUpdate(to object: Any) {
        precondition(object is ZAHomeScreenRowData)
        rowData = object as! ZAHomeScreenRowData
    }
}

extension HomeTeaserSectionController: ListSupplementaryViewSource {
    func supportedElementKinds() -> [String] {
        return [UICollectionElementKindSectionHeader]
    }
    
    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        guard let header = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, for: self, nibName: "HomeHeaderReusableView", bundle: nil, at: index) else {
            fatalError()
        }
        
        return header
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 44.0)
    }
}
