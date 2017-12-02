//
//  ZAConfig.swift
//  ZaloraJupiterCore
//
//  Created by Nghia Tran on 12/2/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

// MARK: - Config User
protocol ConfigUser {
    
    var name: String { get }
    var gender: String { get }
    var segment: String { get }
    var country: String { get }
}

// MARK: - Feature Flag
protocol ConfigFeatureFlag {
    
    var isEnableSuggestionSearch: Bool { get }
    var isEnableFBLogin: Bool { get }
    var isEnableProactivelyFetchCart: Bool { get }
    var isEnableProactivelyFetchWallet: Bool { get }
}

// MARK: - General infomation for Tracking
protocol ConfigTracking {
    
    var customerID: String { get }
    var idForAdvertised: String { get }
}
