
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
    private lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(),
                                  viewController: self.viewController)
        adapter.dataSource = self
        return adapter
    }()
    
    override init() {
        super.init()
        self.supplementaryViewSource = self
    }
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "HomeRowViewCell", bundle: nil, for: self, at: index) as? HomeRowViewCell else {
            fatalError()
        }
        
        adapter.collectionView = cell.collectionView
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
        guard let header = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, for: self, nibName: "HomeHeaderReusableView", bundle: nil, at: index) as? HomeHeaderReusableView else {
            fatalError()
        }
        header.titleLbl.text = rowData.title
        return header
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 44.0)
    }
}

extension HomeTeaserSectionController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [ZATeaserModel(teasers: rowData.teasers)]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return HomeEmbeddedTeaserSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
