
//
//  TrackingParameterTests.swift
//  ZaloraJupiterCoreTests
//
//  Created by Nghia Tran on 12/3/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import XCTest
@testable import ZaloraJupiterCore

class TrackingParameterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTrackingHomeParamCorrect() {
        
        // Given
        let param = TrackingHomeParam()
        let expexted: [String: String] = ["gaid": "GTM-NHXW4J",
                                          "event": "openHomeScreen",
                                          "customerID": "customerID",
                                          "idForAdvertising": "2D92592A-BF42-441A-A995-F531AA0C791B"]
        
        // When
        let gtmParam = param.toGTMParam() as! [String: String]
        let adjustParam = param.toAdjustParam()
        
        // Then
        XCTAssertEqualDictionaries(gtmParam, expexted)
        XCTAssertNil(adjustParam, "Adjust Param should be nil")
    }
    
    func testOpenScreenTrackingParam() {
        
        // Given
        let screenName = "Feed"
        let param = OpenScreenTrackingParam(screenName: screenName)
        let gtmExpexted: [String: String] = ["gaid": "GTM-NHXW4J",
                                          "event": "openscreen",
                                          "screenName": screenName,
                                          "customerID": "customerID",
                                          "idForAdvertising": "2D92592A-BF42-441A-A995-F531AA0C791B"]
        let adjustExpected: [String: Any] = ["adjustCallbackParameters": ["screenName": screenName],
                              "eventToken": "openscreen",
                              "adjustPartnerParameters": [:]]
        
        // When
        let gtmParam = param.toGTMParam() as! [String: String]
        let adjustParam = param.toAdjustParam()
        
        // Then
        XCTAssertNotNil(adjustParam, "Adjust Param shouldn't be nil")
        XCTAssertNotNil(gtmParam, "GTM Param shouldn't be nil")
        XCTAssertEqualDictionaries(gtmParam, gtmExpexted)
        XCTAssertEqual(adjustExpected.keys, adjustParam!.keys, "")
//        XCTAssertEqual(adjustExpected.values, adjustParam.values, "")
    }
    
    func testSelectTeaserTrackingParam() {
        
        // Given
        let teaser = ZATeaser(name: "Best Seller", url: "http://zalora.com")
        let param = SelectTeaserTrackingParam(teaser: teaser)
        let expexted: [String: String] = ["gaid": "GTM-NHXW4J",
                                          "event": "selectTeaser",
                                          "TeaserID": "Best Seller",
                                          "customerID": "customerID",
                                          "idForAdvertising": "2D92592A-BF42-441A-A995-F531AA0C791B"]
        
        // When
        let gtmParam = param.toGTMParam() as! [String: String]
        let adjustParam = param.toAdjustParam()
        
        // Then
        XCTAssertEqualDictionaries(gtmParam, expexted)
        XCTAssertNil(adjustParam, "Adjust Param should be nil")
    }
}
