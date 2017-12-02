//
//  TrackingType.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

// MARK: - Tracking Home
public protocol TrackingServiceHome {
    
    // Open app at the first time
    func trackHomeOpen()
    
    // User click on certain Teaser
    func trackSelectTeaser(_ teaser: ZATeaser)
    
    // User click on certain Product
    func trackSelectProducr(_ product: ZAProduct)
}

// MARK: - Tracking Menub
public protocol TrackingServiceMenu {
    
    // User tap on any button
    func trackSelectButton()
    
    // User Logout
    func trackLogout()
}

// MARK: - App Activities
public protocol TrackingServiceActivity {
    
    // Open app
    func trackOpenApp()
    
    // Hide app
    func trackHideApp()
    
    // Open any screen
    func trackOpenScreen(_ screenName: String)
}
