//
//  Comparation.swift
//  ZaloraJupiterCoreTests
//
//  Created by Nghia Tran on 12/2/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation
import XCTest

func XCTAssertEqualDictionaries<S, T: Equatable>(first: [S:T], _ second: [S:T]) {
    XCTAssert(first == second)
}

