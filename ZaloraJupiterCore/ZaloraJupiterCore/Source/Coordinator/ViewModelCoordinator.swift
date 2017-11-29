//
//  ViewModelCoordinator.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation

protocol ViewModelCoordinatorProtocol {
    
}

class ViewModelCoordinator {
   
    // MARK: View model
    fileprivate let appViewModel: AppViewModelType
    fileprivate let homeViewModel: HomeViewModelType
    
    // MARK: Init
    init(appViewModel: AppViewModelType,
         homeViewModel: HomeViewModelType) {
        self.appViewModel = appViewModel
        self.homeViewModel = homeViewModel
    }
}
