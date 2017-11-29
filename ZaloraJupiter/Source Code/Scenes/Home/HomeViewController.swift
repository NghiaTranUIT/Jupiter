//
//  HomeViewController.swift
//  ZaloraJupiter
//
//  Created by NghiaTran on 11/28/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import UIKit
import ZaloraJupiterCore
import IGListKit
import SideMenu

class HomeViewController: UIViewController {

    // MARK: OUTLET
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Variable
    var viewModel: HomeViewModelType!
    fileprivate lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        adapter.collectionView = collectionView
        adapter.dataSource = self
        
        // Track
        viewModel.tracking.trackHomeOpen()
        
        // Fetch
        viewModel.input.loadProduct { [unowned self] in
            self.adapter.reloadData(completion: nil)
        }
        
        SideMenuManager.defaultManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view, forMenu: UIRectEdge.left)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension HomeViewController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return viewModel.output.homeScreenRows
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let rowData = object as! ZAHomeScreenRowData
        switch rowData.type {
        case .DataJet:
            return HomeProductSectionController()
        case .Teaser:
            return HomeTeaserSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
