//
//  EmptyTrackingService.swift
//  ZaloraJupiterCoreTests
//
//  Created by Nghia Tran on 12/2/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation
@testable import ZaloraJupiterCore

struct EmptyTrackingService: TrackingServiceProtocol, TrackingServiceHome {
    
    func trackHomeOpen() {}
    
    func trackSelectProducr(_ product: ZAProduct) {}
    
    func trackSelectTeaser(_ teaser: ZATeaser) {}
    
    func tracking(with param: TrackingParameter) {}
}
