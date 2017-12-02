//
//  HomeViewModelTests.swift
//  ZaloraJupiterCoreTests
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import XCTest
@testable import ZaloraJupiterCore

struct StubNetworkService: NetworkServiceProtocol, NetworkServiceHome {
    
    let rowDatas: [ZAHomeScreenRowData]
    
    func fetchHomeProduct(_ completion: ([ZAHomeScreenRowData]) -> Void) {
        completion(rowDatas)
    }
}

class HomeViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchHomeRowDataSuccess() {
        let input = [ZAHomeScreenRowData(endpoint: "/1", title: "Best Seller", products: [], teasers: []),
                     ZAHomeScreenRowData(endpoint: "/2", title: "Best Seller", products: [], teasers: []),
                     ZAHomeScreenRowData(endpoint: "/3", title: "Best Seller", products: [], teasers: [])]
        let network = StubNetworkService(rowDatas: input)
        let viewModel = HomeViewModel(trackingService: EmptyTrackingService(), networkService: network)
        
        viewModel.input.loadProduct {}
        
        XCTAssertEqual(input.count, viewModel.output.homeScreenRows.count, "View model Count should have same data")
        XCTAssertEqual(input, viewModel.output.homeScreenRows, "View model Count should have same data")
    }
}
