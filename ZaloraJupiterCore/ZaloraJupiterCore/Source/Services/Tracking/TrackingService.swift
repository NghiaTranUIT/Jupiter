//
//  GeneralTracking.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

protocol TrackingServiceProtocol {
    func tracking(with param: TrackingParameter)
}

typealias TrackingServiceType = TrackingServiceProtocol & TrackingServiceHome & TrackingServiceMenu & TrackingServiceActivity

class TrackingService: TrackingServiceType {
    
    private let gtm: TrackerProtocol
    private let adjust: TrackerProtocol
    
    init(gtm: TrackerProtocol, adjust: TrackerProtocol) {
        self.gtm = gtm
        self.adjust = adjust
    }
    
    convenience init() {
        self.init(gtm: GTMTracker(), adjust: AdjustTracker())
    }
    
    func tracking(with param: TrackingParameter) {
        
        // GTM Tracking if need
        if let gtmParam = param.toGMTParam() {
            gtm.tracking(with: gtmParam)
        }
        
        // Adjust Tracking if need
        if let adjustParam = param.toAdjustParam() {
            adjust.tracking(with: adjustParam)
        }
    }
}

extension TrackingService {
    
    public func trackHomeOpen() {
    }
    
    func trackSelectTeaser(_ teaser: ZATeaser) {
        let param = SelectTeaserTrackingParam(teaser: teaser)
        tracking(with: param)
    }

    func trackSelectProducr(_ product: ZAProduct) {
        
    }
}

extension TrackingService {
    func trackSelectButton() {
    }
    
    func trackLogout() {
    }
}

extension TrackingService {
    
    func trackHideApp() {
        
    }
    
    func trackOpenApp() {
        
    }
    
    func trackOpenScreen(_ screenName: String) {
        let param = OpenScreenTrackingParam(screenName: screenName)
        tracking(with: param)
    }
}
