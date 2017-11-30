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
}

public class ViewModelCoordinator: ViewModelCoordinatorType {
   
    // MARK: View model
    public let appViewModel: AppViewModelType
    public let homeViewModel: HomeViewModelType
    public let menuViewModel: MenuViewModelType
    
    // MARK: Init
    init(appViewModel: AppViewModelType,
         homeViewModel: HomeViewModelType,
         menuViewModel: MenuViewModelType) {
        self.appViewModel = appViewModel
        self.homeViewModel = homeViewModel
        self.menuViewModel = menuViewModel
    }
}

extension ViewModelCoordinator {
    
    public class func defaultApp() -> ViewModelCoordinatorType {
        
        // Services
        let tracking = TrackingService()
        let network = NetworkService()
        let deepURL = DeepURLService.default()
        
        // View Modesl
        let app = AppViewModel(trackingService: tracking, urlService: deepURL)
        let home = HomeViewModel(trackingService: tracking,
                                 networkService: network)
        let menu = MenuViewModel(trackingService: tracking,
                                 networkService: network)
        
        return ViewModelCoordinator(appViewModel: app,
                                    homeViewModel: home,
                                    menuViewModel: menu)
    }
}
