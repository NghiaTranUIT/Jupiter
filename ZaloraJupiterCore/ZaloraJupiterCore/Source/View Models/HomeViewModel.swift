//
//  HomeViewModel.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/28/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

public typealias EmptyBlock = () -> Void

public protocol HomeViewModelProtocol {
    
    var input: HomeViewModelInput { get }
    var output: HomeViewModelOutput { get }
    var tracking: HomeTracking { get }
}

public protocol HomeViewModelInput {
    
    func loadProduct(_ completion: EmptyBlock)
}

public protocol HomeViewModelOutput {
    
    var homeScreenRows: [ZAHomeScreenRowData] { get }
}

public typealias HomeViewModelType = HomeViewModelProtocol & HomeViewModelInput & HomeViewModelOutput & HomeTracking

public class HomeViewModel: HomeViewModelType {
    
    // MARK: View model
    public var input: HomeViewModelInput { return self }
    public var output: HomeViewModelOutput { return self }
    public var tracking: HomeTracking { return self }
    
    // MARK: Output
    public var homeScreenRows: [ZAHomeScreenRowData] = []
    
    // MARK: Variable
    private let trackingService: TrackingServiceProtocol & HomeTracking
    private let networkService: NetworkServiceProtocol & NetworkServiceHome
    
    init(trackingService: TrackingServiceProtocol & HomeTracking,
         networkService: NetworkServiceProtocol & NetworkServiceHome) {
        self.trackingService = trackingService
        self.networkService = networkService
    }
    
    public func loadProduct(_ completion: EmptyBlock) {
        networkService.fetchHomeProduct {[unowned self] (rows) in
            self.homeScreenRows = rows
            completion()
        }
    }
}

// MARK: Tracking
extension HomeViewModel {
    
    public func trackHomeOpen() {
        trackingService.trackHomeOpen()
    }
    
    public func trackClickBrand() {
        trackingService.trackClickBrand()
    }
    
    public func trackClickCatagory() {
        trackingService.trackClickCatagory()
    }
}
