//
//  ViewModelCoordinator.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

public protocol ViewModelCoordinatorType: class {
    
    var appViewModel: AppViewModelType { get }
    var homeViewModel: HomeViewModelType { get }
    var menuViewModel: MenuViewModelType { get }
    var catalogViewModel: CatalogViewModelType { get }
}

public class ViewModelCoordinator: ViewModelCoordinatorType {
   
    // MARK: View model
    public lazy var appViewModel: AppViewModelType = {
        return AppViewModel(trackingService: self.trackingService, urlService: self.deepURLService)
    }()
    public var homeViewModel: HomeViewModelType {
        return HomeViewModel(trackingService: self.trackingService,
                             networkService: self.networkService)
    }
    public var menuViewModel: MenuViewModelType {
        return MenuViewModel(trackingService: self.trackingService,
                             networkService: self.networkService)
    }
    public var catalogViewModel: CatalogViewModelType {
        return CatalogViewModel()
    }
    
    // MARK: Services
    fileprivate let trackingService: TrackingServiceType
    fileprivate let networkService: NetworkServiceType
    fileprivate let deepURLService: DeepURLServiceType
    
    // MARK: Init
    init(trackingService: TrackingServiceType, networkService: NetworkServiceType, deepURLService: DeepURLServiceType) {
        self.trackingService = trackingService
        self.networkService = networkService
        self.deepURLService = deepURLService
    }
}

// MARK: Default
extension ViewModelCoordinator {
    
    public class func defaultApp() -> ViewModelCoordinatorType {
        
        // Services
        let tracking = TrackingService()
        let network = NetworkService()
        let deepURL = DeepURLService.default()
        
        return ViewModelCoordinator(trackingService: tracking,
                                    networkService: network,
                                    deepURLService: deepURL)
    }
}
