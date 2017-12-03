//
//  Trackers.swift
//  ZaloraJupiterCoreTests
//
//  Created by Nghia Tran on 12/2/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation
@testable import ZaloraJupiterCore


class SpyGTMTracker: TrackerProtocol {
    
    var isCallTracking = false
    var sentParam: [String: Any] = [:]
    
    func tracking(with param: [String : Any]) {
        isCallTracking = true
        sentParam = param
    }
}

class SpyAdjustTracker: TrackerProtocol {
    
    var isCallTracking = false
    var sentParam: [String: Any] = [:]
    
    func tracking(with param: [String : Any]) {
        isCallTracking = true
        sentParam = param
    }
}

struct OnlyGTMParam: TrackingParameter {
    var event: String { return "OnlyGTMParam" }
    func toGTMParam() -> [String : Any]? {
        return [:]
    }
}

struct OnlyAdjustParam: TrackingParameter {
    var event: String { return "OnlyAdjustParam" }
    func toAdjustParam() -> [String : Any]? {
        return [:]
    }
}

struct GTMAndAdjustParam: TrackingParameter {
    var event: String { return "GTMAndAdjustParam" }
    
    func toAdjustParam() -> [String : Any]? {
        return [:]
    }
    
    func toGTMParam() -> [String : Any]? {
        return [:]
    }
}

