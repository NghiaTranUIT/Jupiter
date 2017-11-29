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
}

public class ViewModelCoordinator: ViewModelCoordinatorType {
   
    // MARK: View model
    public let appViewModel: AppViewModelType
    public let homeViewModel: HomeViewModelType
    
    // MARK: Init
    init(appViewModel: AppViewModelType,
         homeViewModel: HomeViewModelType) {
        self.appViewModel = appViewModel
        self.homeViewModel = homeViewModel
    }
}

extension ViewModelCoordinator {
    
    public class func defaultApp() -> ViewModelCoordinatorType {
        let tracking = TrackingService()
        let network = NetworkService()
        
        let app = AppViewModel()
        let home = HomeViewModel(trackingService: tracking,
                                 networkService: network)
        return ViewModelCoordinator(appViewModel: app,
                                    homeViewModel: home)
    }
}
