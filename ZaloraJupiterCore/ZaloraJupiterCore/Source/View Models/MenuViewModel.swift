//
//  MenuViewModel.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

public protocol MenuViewModelProtocol {
    
    var input: MenuViewModelInput { get }
    var output: MenuViewModelOuput { get }
    var tracking: MenuTracking { get }
}

public protocol MenuViewModelInput {
    
    func loadMenu(_ completion: EmptyBlock)
}

public protocol MenuViewModelOuput {
    var menuDatas: [ZAMenuData] { get }
}

public  typealias MenuViewModelType = MenuViewModelProtocol & MenuViewModelInput & MenuViewModelOuput & MenuTracking

public class MenuViewModel: MenuViewModelType {
    
    // MARK: View Model
    public var input: MenuViewModelInput { return self }
    public var output: MenuViewModelOuput { return self }
    public var tracking: MenuTracking { return self }
    
    // MARK: Output
    public var menuDatas: [ZAMenuData] = []
    
    // MARK: Services
    private let trackingService: TrackingServiceProtocol & MenuTracking
    private let networkService: NetworkServiceProtocol & NetworkServiceMenu
    
    // MARK: Init
    init(trackingService: TrackingServiceProtocol & MenuTracking,
         networkService: NetworkServiceProtocol & NetworkServiceMenu) {
        self.trackingService = trackingService
        self.networkService = networkService
    }
    
    public func loadMenu(_ completion: () -> Void) {
        networkService.fetchMenu(completion)
    }
}

extension MenuViewModel {
    public func trackLogout() {
        trackingService.trackLogout()
    }
    
    public func trackSelectButton() {
        trackingService.trackSelectButton()
    }
}
