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
    var tracking: TrackingServiceHome { get }
}

public protocol HomeViewModelInput {
    
    func loadProduct(_ completion: EmptyBlock)
}

public protocol HomeViewModelOutput {
    
    var homeScreenRows: [ZAHomeScreenRowData] { get }
}

public typealias HomeViewModelType = HomeViewModelProtocol & HomeViewModelInput & HomeViewModelOutput & TrackingServiceHome

public class HomeViewModel: HomeViewModelType {
    
    // MARK: View model
    public var input: HomeViewModelInput { return self }
    public var output: HomeViewModelOutput { return self }
    public var tracking: TrackingServiceHome { return self }
    
    // MARK: Output
    public var homeScreenRows: [ZAHomeScreenRowData] = []
    
    // MARK: Variable
    private let trackingService: TrackingServiceProtocol & TrackingServiceHome
    private let networkService: NetworkServiceProtocol & NetworkServiceHome
    
    // MARK: Init
    init(trackingService: TrackingServiceProtocol & TrackingServiceHome,
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
    
    public func trackClickBrand(_ brand: ZABrand) {
        trackingService.trackClickBrand(brand)
    }
    
    public func trackClickCatagory(_ catalog: ZACatalog) {
        trackingService.trackClickCatagory(catalog)
    }
}
