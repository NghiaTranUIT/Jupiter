//
//  AppViewModel.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation


protocol AppViewModelProtocol {
    
    var input: AppViewModelInput { get }
    var output: AppViewModelOutput { get }
}

protocol AppViewModelInput {
    
    func appDidLaunch(with options: [UIApplicationLaunchOptionsKey: Any]?)
    func applicationDidEnterBackground()
    func applicationWillEnterForeground()
    func applicationDidBecomeActive()
    func application(open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool
}

protocol AppViewModelOutput {
    
}

typealias AppViewModelType = AppViewModelProtocol & AppViewModelInput & AppViewModelOutput

class AppViewModel: AppViewModelType {
    
    // MARK: View model
    var input: AppViewModelInput { return self }
    var output: AppViewModelOutput { return self }
    
    init() {
        
    }
    
    // MARK: Input
    func appDidLaunch(with options: [UIApplicationLaunchOptionsKey: Any]?) {
        
    }
    
    func applicationDidEnterBackground() {
        
    }
    
    func applicationWillEnterForeground() {
        
    }
    
    func applicationDidBecomeActive() {
        
    }
    
    func application(open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        return true
    }
}

