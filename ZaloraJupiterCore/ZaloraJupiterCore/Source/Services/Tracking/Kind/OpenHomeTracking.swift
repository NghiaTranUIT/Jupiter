//
//  OpenHomeTracking.swift
//  ZaloraJupiterCore
//
//  Created by Nghia Tran on 12/2/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

struct TrackingHomeParameter: TrackingParameter {

    // MARK: - Variable
    var event: String { return Constants.Tracking.GTM.Event.OpenHomeScreen }
    
    // MARK: - Param
    func toGMTParam() -> [String: Any]? {
        var param = defaultGTMParam()
        param[Constants.Tracking.GTM.Parameter.CustomerID] = ZAAppConfig.shared.customerID
        param[Constants.Tracking.GTM.Parameter.IDForAdvertising] = ZAAppConfig.shared.idForAdvertised
        return param
    }
    
    func toAdjustParam() -> [String: Any]? {
        return nil
    }
}
