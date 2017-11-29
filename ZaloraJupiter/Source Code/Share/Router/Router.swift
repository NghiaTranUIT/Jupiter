//
//  Router.swift
//  ZaloraJupiter
//
//  Created by NghiaTran on 11/29/17.
//  Copyright © 2017 Zalora. All rights reserved.
//

import UIKit
import ZaloraJupiterCore
import SideMenu

enum RouterType {
    
    case home
    case pdv
    case catalog
    case menu
}

class Router {
    
    // MARK: Private
    private unowned let coordinator: ViewModelCoordinatorType
    
    // MARK: Init
    init(coordinator: ViewModelCoordinatorType) {
        self.coordinator = coordinator
        setupSideMenu()
    }
    
    // MARK: Public
    func initMainWindow() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = controllerForRouter(type: .home)
        window.makeKeyAndVisible()
        return window
    }
}

extension Router {
    
    /// Defind the core of router
    ///
    /// - Parameter type: RouterType's instance
    /// - Returns: Desised controller
    fileprivate func controllerForRouter(type: RouterType) -> UIViewController {
        switch type {
        case .home:
            let controller = HomeViewController(nibName: "HomeViewController", bundle: nil)
            controller.viewModel = coordinator.homeViewModel
            
            // Attach to UINavigationController
            let navigation = UINavigationController(rootViewController: controller)
            return navigation
            
        case .menu:
            let controller = MenuViewController(nibName: "MenuViewController", bundle: nil)
            return controller
            
        default: // Didn't support yet
            return UIViewController()
        }
    }
    
    fileprivate func setupSideMenu() {
        let home = UISideMenuNavigationController(rootViewController: controllerForRouter(type: .menu))
        SideMenuManager.defaultManager.menuLeftNavigationController = home
    }
}
