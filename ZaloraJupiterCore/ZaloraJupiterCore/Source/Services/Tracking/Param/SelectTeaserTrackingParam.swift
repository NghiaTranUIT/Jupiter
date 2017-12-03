//
//  ClickBrandTrackingParam.swift
//  ZaloraJupiterCore
//
//  Created by Nghia Tran on 12/2/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

struct SelectTeaserTrackingParam: TrackingParameter {
    
    var event: String { return Constants.Tracking.GTM.Event.SelectTeaser }
    let teaser: ZATeaser
}

extension SelectTeaserTrackingParam {
    
    func toGTMParam() -> [String: Any]? {
        var param = defaultGTMParam()
        param[Constants.Tracking.GTM.Parameter.TeaserID] = teaser.name
        return param
    }
}
