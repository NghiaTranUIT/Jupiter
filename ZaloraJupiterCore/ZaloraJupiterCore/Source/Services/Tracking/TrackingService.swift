//
//  GeneralTracking.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

protocol TrackingServiceProtocol {}

typealias TrackingServiceType = TrackingServiceProtocol & TrackingServiceHome & TrackingServiceMenu & TrackingServiceActivity

class TrackingService: TrackingServiceType {
    
    private let gtm: GTMTrackerType
    private let adjust: AdjustTrackerType
    
    init(gtm: GTMTrackerType, adjust: AdjustTrackerType) {
        self.gtm = gtm
        self.adjust = adjust
    }
    
    convenience init() {
        self.init(gtm: GTMTracker(), adjust: AdjustTracker())
    }
}

extension TrackingService {
    
    public func trackHomeOpen() {
        gtm.trackHomeOpen()
    }
    
    public func trackClickBrand() {
        gtm.trackClickBrand()
    }
    
    public func trackClickCatagory() {
        gtm.trackClickCatagory()
    }
}

extension TrackingService {
    func trackSelectButton() {
        gtm.trackSelectButton()
    }
    
    func trackLogout() {
        gtm.trackLogout()
    }
}

extension TrackingService {
    
    func trackHideApp() {
        
    }
    
    func trackOpenApp() {
        
    }
}
