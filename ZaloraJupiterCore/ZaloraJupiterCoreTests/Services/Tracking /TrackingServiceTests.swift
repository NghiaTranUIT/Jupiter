//
//  TrackingServiceTests.swift
//  ZaloraJupiterCoreTests
//
//  Created by Nghia Tran on 12/2/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import XCTest
@testable import ZaloraJupiterCore

class TrackingServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExectureCorrectTrackerWithGTMTracker() {
        
        // Given
        let gtm = SpyGTMTracker()
        let adjust = SpyAdjustTracker()
        let service = TrackingService(gtm: gtm, adjust: adjust)
        let param = OnlyGTMParam()
        
        // When
        service.tracking(with: param)
        
        // Then
        XCTAssertTrue(gtm.isCallTracking, "GTM Tracker should be call")
        XCTAssertFalse(adjust.isCallTracking,"Adjust Tracker shouldn't be call")
    }
    
    func testExectureCorrectTrackerWithAdjustTracker() {
        
        // Given
        let gtm = SpyGTMTracker()
        let adjust = SpyAdjustTracker()
        let service = TrackingService(gtm: gtm, adjust: adjust)
        let param = OnlyAdjustParam()
        
        // When
        service.tracking(with: param)
        
        // Then
        XCTAssertFalse(gtm.isCallTracking, "GTM Tracker shouldn't be call")
        XCTAssertTrue(adjust.isCallTracking,"Adjust Tracker should be call")
    }
    
    func testExectureCorrectTrackerWithGTMAndAdjustTracker() {
        
        // Given
        let gtm = SpyGTMTracker()
        let adjust = SpyAdjustTracker()
        let service = TrackingService(gtm: gtm, adjust: adjust)
        let param = GTMAndAdjustParam()
        
        // When
        service.tracking(with: param)
        
        // Then
        XCTAssertTrue(gtm.isCallTracking, "GTM Tracker should be call")
        XCTAssertTrue(adjust.isCallTracking,"Adjust Tracker should be call")
    }
    
    func testTrackerSentSelectTeaserTrackingWithCorrectParam() {
        
        // Given
        let gtm = SpyGTMTracker()
        let adjust = SpyAdjustTracker()
        let service = TrackingService(gtm: gtm, adjust: adjust)
        let selectedTeaser = ZATeaser(name: "Best Selling Teaser", url: "http://zalora.com")
        let expected: [String: String] = ["gaid": "GTM-NHXW4J",
                                        "event": "selectTeaser",
                                        "TeaserID": "Best Selling Teaser",
                                        "customerID": "customerID",
                                        "idForAdvertising": "2D92592A-BF42-441A-A995-F531AA0C791B"]
        
        // When
        service.trackSelectTeaser(selectedTeaser)
        
        // Then
        XCTAssertEqualDictionaries(expected, gtm.sentParam as! [String: String])
        XCTAssertTrue(gtm.isCallTracking, "GTM Tracker should be call")
        XCTAssertFalse(adjust.isCallTracking,"Adjust Tracker shouldn't be call")
    }
    
    func testTrackerSentOpenScreenTrackingWithCorrectParam() {
        
        // Given
        let gtm = SpyGTMTracker()
        let adjust = SpyAdjustTracker()
        let service = TrackingService(gtm: gtm, adjust: adjust)
        let expectedGTM: [String: String] = ["gaid": "GTM-NHXW4J",
                                          "event": "openscreen",
                                          "screenName": "ProfileScreen",
                                          "customerID": "customerID",
                                          "idForAdvertising": "2D92592A-BF42-441A-A995-F531AA0C791B"]
        let expectedAdjust: [String: Any] = ["adjustCallbackParameters": ["screenName": "ProfileScreen"],
                                                "eventToken": "openscreen",
                                                "adjustPartnerParameters": [:]]
        
        // When
        service.trackOpenScreen("ProfileScreen")
        
        // Then
        XCTAssertEqualDictionaries(expectedGTM, gtm.sentParam as! [String: String])
        XCTAssertEqual(expectedAdjust.keys, adjust.sentParam.keys, "")
//        XCTAssertEqual(expectedAdjust.values, adjust.sentParam.values, "")
        XCTAssertTrue(gtm.isCallTracking, "GTM Tracker should be called")
        XCTAssertTrue(adjust.isCallTracking,"Adjust Tracker should be called")
    }
}
