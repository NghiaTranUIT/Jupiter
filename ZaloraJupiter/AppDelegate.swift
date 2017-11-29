//
//  AppDelegate.swift
//  ZaloraJupiter
//
//  Created by NghiaTran on 11/28/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import UIKit
import ZaloraJupiterCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Variable
    private var coordinator: ViewModelCoordinatorType!
    private var router: Router!
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Create window
        coordinator = ViewModelCoordinator.defaultApp()
        router = Router(coordinator: coordinator)
        window = router.initMainWindow()
        
        // Handle
        coordinator.appViewModel.appDidLaunch(with: launchOptions)
        
        return true
    }


    func applicationDidEnterBackground(_ application: UIApplication) {
        coordinator.appViewModel.applicationDidEnterBackground()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        coordinator.appViewModel.applicationWillEnterForeground()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        coordinator.appViewModel.applicationDidBecomeActive()
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return coordinator.appViewModel.application(open: url,
                                                    options: options)
    }
}

