//
//  ZAConfig.swift
//  ZaloraJupiterCore
//
//  Created by Nghia Tran on 12/2/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation
import AdSupport

// MARK: - App Config
class ZAAppConfig {
    
    static let shared = ZAAppConfig()
}

// MARK: - ConfigFeatureFlag
extension ZAAppConfig: ConfigFeatureFlag {
    var isEnableSuggestionSearch: Bool {
        return true
    }
    
    var isEnableFBLogin: Bool {
        return true
    }
    
    var isEnableProactivelyFetchCart: Bool {
        return true
    }
    
    var isEnableProactivelyFetchWallet: Bool {
        return true
    }
}

// MARK: - ConfigUser
extension ZAAppConfig: ConfigUser {
    var name: String {
        return ZAUser.shared.name
    }
    
    var gender: String {
        return ZAUser.shared.gender
    }
    
    var segment: String {
        return "men"
    }
    
    var country: String {
        return "sg"
    }
}

extension ZAAppConfig: ConfigTracking {
    var customerID: String {
        return ZAUser.shared.customerID
    }
    
    var idForAdvertised: String {
        return "2D92592A-BF42-441A-A995-F531AA0C791B"
    }
}
