//
//  HomeViewModel.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/28/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

public protocol HomeViewModelProtocol {
    
    var input: HomeViewModelInput { get }
    var output: HomeViewModelOutput { get }
    var tracking: HomeTracking { get }
}

public protocol HomeViewModelInput {
    
    func loadProduct()
}

public protocol HomeViewModelOutput {
    
    var products: [Product] { get }
}

public typealias HomeViewModelType = HomeViewModelProtocol & HomeViewModelInput & HomeViewModelOutput & HomeTracking

public class HomeViewModel: HomeViewModelType {
    
    // MARK: View model
    public var input: HomeViewModelInput { return self }
    public var output: HomeViewModelOutput { return self }
    public var tracking: HomeTracking { return self }
    
    // MARK: Output
    public var products: [Product] = []
    
    // MARK: Variable
    private let trackingService: TrackingServiceType & HomeTracking
    private let networkService: NetworkServiceProtocol & NetworkServiceHome
    
    init(trackingService: TrackingServiceType & HomeTracking,
         networkService: NetworkServiceProtocol & NetworkServiceHome) {
        self.trackingService = trackingService
        self.networkService = networkService
    }
    
    public func loadProduct() {
         networkService.fetchHomeProduct()
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
