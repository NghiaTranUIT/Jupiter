//
//  NetworkServiceTests.swift
//  ZaloraJupiterCoreTests
//
//  Created by Nghia Tran on 12/3/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import XCTest
@testable import ZaloraJupiterCore

struct StubJSONFetcher: NetworkFetchable {
    
    var rowData: [ZAHomeScreenRowData]
    
    func get<T>(_ request: AnyRequest<T>) -> T.Element {
        return rowData as! T.Element
    }
}

class NetworkServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFetchHomeProductRequest() {
        
        // Given
        let product = ZAProduct(name: "Addias", url: "/shoes/addias")
        let teaser = ZATeaser(name: "Best of best", url: "/teaser/best")
        let expected = [ZAHomeScreenRowData(endpoint: "/home",
                                          title: "Best Seller",
                                          products: [product],
                                          teasers: [teaser])]
        let fetcher = StubJSONFetcher(rowData: expected)
        let service = NetworkService(fetcher: fetcher)
        
        // When
        let exectation = expectation(description: "Wait Home Fetch Request")
        service.fetchHomeProduct { (rowDatas) in
            XCTAssertEqual(rowDatas.count, expected.count, "Row Data should same count")
            XCTAssertEqual(rowDatas, expected)
            exectation.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 5.0) { (_) in
            
        }
    }
}
