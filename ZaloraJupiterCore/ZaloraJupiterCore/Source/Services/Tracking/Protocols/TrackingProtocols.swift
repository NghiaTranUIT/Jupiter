//
//  TrackingType.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

public protocol HomeTracking {
    
    func trackHomeOpen()
    func trackClickBrand()
    func trackClickCatagory()
}

public protocol MenuTracking {
    
    func trackSelectButton()
    func trackLogout()
}
