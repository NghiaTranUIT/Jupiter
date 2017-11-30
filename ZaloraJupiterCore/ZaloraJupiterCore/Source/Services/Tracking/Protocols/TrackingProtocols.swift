//
//  TrackingType.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

public protocol TrackingServiceHome {
    
    func trackHomeOpen()
    func trackClickBrand()
    func trackClickCatagory()
}

public protocol TrackingServiceMenu {
    
    func trackSelectButton()
    func trackLogout()
}

public protocol TrackingServiceActivity {
    
    func trackOpenApp()
    func trackHideApp()
}
