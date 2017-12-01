//
//  HomeProductViewCell.swift
//  ZaloraJupiter
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import UIKit
import ZaloraJupiterCore

class HomeProductViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func config(_ product: ZAProduct) {
        nameLbl.text = product.name
        contentView.backgroundColor = UIColor(hexString: "#19B5FE")
    }
    
}
