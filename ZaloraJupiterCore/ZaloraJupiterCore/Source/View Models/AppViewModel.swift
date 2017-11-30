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
    var tracking: TrackingServiceActivity { get }
}

public protocol AppViewModelInput {
    
    func appDidLaunch(with options: [UIApplicationLaunchOptionsKey: Any]?)
    func applicationDidEnterBackground()
    func applicationWillEnterForeground()
    func applicationDidBecomeActive()
    func application(open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool
}

public protocol AppViewModelOutput {
    
    var handleURLSchemeCallback: ((DeepURLScheme) -> Void)! { get set }
}

public typealias AppViewModelType = AppViewModelProtocol & AppViewModelInput & AppViewModelOutput

public class AppViewModel: AppViewModelType {
    
    // MARK: View model
    public var input: AppViewModelInput { return self }
    public var output: AppViewModelOutput { return self }
    public var tracking: TrackingServiceActivity { return self }
    
    // MARK: Service
    fileprivate let trackingService: TrackingServiceProtocol & TrackingServiceActivity
    fileprivate let urlService: DeepURLServiceProtocol
    
    // MARK: Output
    public var handleURLSchemeCallback: ((DeepURLScheme) -> Void)!
    
    // MARK: Init
    init(trackingService: TrackingServiceProtocol & TrackingServiceActivity,
         urlService: DeepURLServiceProtocol) {
        self.trackingService = trackingService
        self.urlService = urlService
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
        let scheme = urlService.handle(url.absoluteString)
        guard scheme.type != .none else {
            return false
        }
        
        // Push to Router
        output.handleURLSchemeCallback(scheme)
        
        return true
    }
}

// MARK: Tracking
extension AppViewModel: TrackingServiceActivity {
    public func trackOpenApp() {
        trackingService.trackOpenApp()
    }
    
    public func trackHideApp() {
        trackingService.trackHideApp()
    }
}
