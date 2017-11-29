//
//  AppViewModel.swift
//  ZaloraJupiterCore
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import Foundation


public protocol AppViewModelProtocol {
    
    var input: AppViewModelInput { get }
    var output: AppViewModelOutput { get }
}

public protocol AppViewModelInput {
    
    func appDidLaunch(with options: [UIApplicationLaunchOptionsKey: Any]?)
    func applicationDidEnterBackground()
    func applicationWillEnterForeground()
    func applicationDidBecomeActive()
    func application(open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool
}

public protocol AppViewModelOutput {
    
}

public typealias AppViewModelType = AppViewModelProtocol & AppViewModelInput & AppViewModelOutput

public class AppViewModel: AppViewModelType {
    
    // MARK: View model
    public var input: AppViewModelInput { return self }
    public var output: AppViewModelOutput { return self }
    
    init() {
        
    }
    
    // MARK: Input
    public func appDidLaunch(with options: [UIApplicationLaunchOptionsKey: Any]?) {
        
    }
    
    public func applicationDidEnterBackground() {
        
    }
    
    public func applicationWillEnterForeground() {
        
    }
    
    public func applicationDidBecomeActive() {
        
    }
    
    public func application(open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        return true
    }
}

