//
//  NetworkProtocols.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

protocol NetworkServiceHome {
    func fetchHomeProduct(_ completion: ([ZAHomeScreenRowData]) -> Void)
}

protocol NetworkServiceMenu {
    func fetchMenu(_ completion: EmptyBlock)
}
