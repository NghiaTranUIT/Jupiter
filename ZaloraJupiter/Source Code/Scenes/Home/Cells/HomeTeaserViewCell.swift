//
//  HomeTeaserViewCell.swift
//  ZaloraJupiter
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import UIKit
import ZaloraJupiterCore

class HomeTeaserViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    func config(_ teaser: ZATeaser) {
        nameLbl.text = teaser.name
        contentView.backgroundColor = UIColor(hexString: "#8E44AD")
    }
}
