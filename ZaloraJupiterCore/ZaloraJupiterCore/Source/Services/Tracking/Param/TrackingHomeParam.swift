//
//  OpenHomeTracking.swift
//  ZaloraJupiterCore
//
//  Created by Nghia Tran on 12/2/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

struct TrackingHomeParam: TrackingParameter {

    // MARK: - Variable
    var event: String { return Constants.Tracking.GTM.Event.OpenHomeScreen }
}

extension TrackingHomeParam {
    
    func toGMTParam() -> [String: Any]? {
        return defaultGTMParam()
    }
}
