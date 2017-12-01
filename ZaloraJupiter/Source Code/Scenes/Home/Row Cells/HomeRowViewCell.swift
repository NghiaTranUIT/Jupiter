//
//  HomeRowViewCell.swift
//  ZaloraJupiter
//
//  Created by NghiaTran on 12/1/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import UIKit

class HomeRowViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    private lazy var horizontalLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.collectionViewLayout = horizontalLayout
    }
}
