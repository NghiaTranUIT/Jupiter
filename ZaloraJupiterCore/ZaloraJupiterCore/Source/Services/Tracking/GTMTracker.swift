//
//  GTMTracking.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

protocol GTMTrackerProtocol {}

typealias GTMTrackerType = GTMTrackerProtocol & TrackingServiceHome & TrackingServiceMenu

class GTMTracker: GTMTrackerType {

}

// MARK: TrackingServiceHome
extension GTMTracker {
    
    public func trackHomeOpen() {
        
    }
    
    public func trackClickBrand() {
        
    }
    
    public func trackClickCatagory() {
        
    }
}

// MARK: TrackingServiceMenu
extension GTMTracker {
    
    func trackSelectButton() {
        
    }
    
    func trackLogout() {
        
    }
}
