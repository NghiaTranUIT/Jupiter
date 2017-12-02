//
//  TrackingParameter.swift
//  ZaloraJupiterCore
//
//  Created by Nghia Tran on 12/2/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

protocol TrackingParameter {
    
    var event: String { get }
    
    func toAdjustParam() -> [String: Any]?
    func toGMTParam() -> [String: Any]?
}

extension TrackingParameter {
    
    func defaultGTMParam() -> [String: Any] {
        return [Constants.Tracking.GTM.Key.Event: event,
                Constants.Tracking.GTM.Parameter.CustomerID: ZAAppConfig.shared.customerID,
                Constants.Tracking.GTM.Parameter.IDForAdvertising: ZAAppConfig.shared.idForAdvertised,
                Constants.Tracking.GTM.Key.GAID: Constants.Tracking.GTM.GAID]
    }
    
    func defaultAdjustParam(callBack: [String: Any], partner: [String: Any]) -> [String: Any] {
        return [Constants.Tracking.Adjust.Key.EventToken: event,
                Constants.Tracking.Adjust.Key.CallBack: callBack,
                Constants.Tracking.Adjust.Key.Partner: partner]
    }
}
