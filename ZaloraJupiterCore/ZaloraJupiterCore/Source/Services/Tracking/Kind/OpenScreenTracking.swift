//
//  OpenScreenTracking.swift
//  ZaloraJupiterCore
//
//  Created by Nghia Tran on 12/2/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

struct OpenScreenTracking: TrackingParameter {
    
    // MARK: - Variable
    var event: String { return Constants.Tracking.GTM.Event.OpenHomeScreen }
    var screenName: String
    
    // MARK: - Param
    func toGMTParam() -> [String: Any]? {
        var param = defaultGTMParam()
        param[Constants.Tracking.GTM.Parameter.CustomerID] = ZAAppConfig.shared.customerID
        param[Constants.Tracking.GTM.Parameter.IDForAdvertising] = ZAAppConfig.shared.idForAdvertised
        param[Constants.Tracking.GTM.Parameter.ScreenName] = screenName
        return param
    }
    
    func toAdjustParam() -> [String: Any]? {
        let callback: [String: Any] = [Constants.Tracking.Adjust.Param.ScreenName: screenName]
        let partner: [String: Any] = [:]
        
        return defaultAdjustParam(callBack: callback, partner: partner)
    }
}
