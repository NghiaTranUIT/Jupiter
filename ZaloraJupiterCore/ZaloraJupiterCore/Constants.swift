//
//  Constants.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 12/1/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

struct Constants {
    
    // MARK: - Zalora
    struct ZaloraAPI {
        
        static let BaseProductionURL = "https://api.zalora.sg/v1"
        static let FetchHomeProduct = "/home"
    }
    
    // MARK: - Tracking
    struct Tracking {
        
        // MARK: - GTM
        struct GTM {
            
            static let GAID = "GTM-NHXW4J"
            
            struct Key {
                static let Event = "event"
                static let GAID = "gaid"
            }
            
            struct Event {
                static let OpenApp = "openApp"
                static let OpenHomeScreen = "openHomeScreen"
                static let Install = "install"
                static let OpenScreen = "openscreen"
                static let SelectTeaser = "selectTeaser"
                static let SelectProduct = "selectProduct"
            }
            
            struct Parameter {
                static let CustomerID = "customerID"
                static let IDForAdvertising = "idForAdvertising"
                static let Country = "country"
                static let Gender = "gender"
                static let ScreenName = "screenName"
                static let TeaserID = "TeaserID"
                static let ProductID = "ProductID"
            }
        }
        
        // MARK: - Adjust
        struct Adjust {
            
            // MARK: - Key
            struct Key {
                static let EventToken = "eventToken"
                static let CallBack = "adjustCallbackParameters"
                static let Partner  = "adjustPartnerParameters"
            }
            
            struct Param {
                static let ScreenName = "screenName"
            }
        }
    }
}
