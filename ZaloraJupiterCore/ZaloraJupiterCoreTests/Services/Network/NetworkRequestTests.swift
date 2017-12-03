//
//  NetworkRequestTests.swift
//  ZaloraJupiterCoreTests
//
//  Created by Nghia Tran on 12/3/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import XCTest
@testable import ZaloraJupiterCore

class NetworkRequestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFetchHomeProductParam() {
        
        // Given
        let user = ZAUser(name: "Zalora", gender: "men")
        let param = FetchHomeProductRequestParameter(user: user)
        let expected: [String: String] = ["name": user.name]
        
        // When
        let dict = param.toDictionary() as! [String : String]
        
        // Then
        XCTAssertEqualDictionaries(expected, dict ,"Should same param")
    }
    
    func testFetchHomeProductRequest() {
        
        // Given
        let param = FetchHomeProductRequestParameter(user: ZAUser.shared)
        
        // When
        let request = FetchHomeProductRequest(param)
        
        // Then
        XCTAssertEqual(request.endpoint, Constants.ZaloraAPI.FetchHomeProduct, "FetchHomeProductRequest Endpoint should be /home")
        XCTAssertEqual(request.httpMethod.rawValue, "GET", "FetchHomeProductRequest should be get")
        
    }
    
    func testFetchHomeDecodeProductRequest() {
        
        // Given
        let param = FetchHomeProductRequestParameter(user: ZAUser.shared)
        let path = Bundle(for: JSONFetcher.self).url(forResource: "FetchHomeProductSample", withExtension: "json")!
        let data = try! Data(contentsOf: path)
        let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
        
        // When
        let request = FetchHomeProductRequest(param)
        let models = try! request.decode(data: json)
        
        XCTAssertNotNil(models, "Model shouldn't be nil")
        XCTAssertEqual(models!.count, 6, "Should equal 6")
    }
}
