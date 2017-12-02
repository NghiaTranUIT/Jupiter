//
//  AppViewModelTests.swift
//  ZaloraJupiterCoreTests
//
//  Created by Nghia Tran on 12/2/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import XCTest
@testable import ZaloraJupiterCore

class ActivityTrackingService: TrackingServiceProtocol, TrackingServiceActivity {
    
    var isCallTrackOpenScreen = false
    var screenName: String = ""
    
    func trackOpenApp() {}
    
    func trackHideApp() {}
    
    func trackOpenScreen(_ screenName: String) {
        isCallTrackOpenScreen = true
        self.screenName = screenName
    }
    
    func tracking(with param: TrackingParameter) {}
}

class AppViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewModelShouldTrackOpenSceenWithCorrectParam() {
        let spyTracking = ActivityTrackingService()
        let viewModel = AppViewModel(trackingService: spyTracking, urlService: EmptyURLService())
        let expected = "HomeScreen"
        
        // When
        viewModel.tracking.trackOpenScreen(expected)

        // Then
        XCTAssertTrue(spyTracking.isCallTrackOpenScreen, "Should call tracking Open screen")
        XCTAssertEqual(spyTracking.screenName, expected, "Should same screenName")
    }
}
