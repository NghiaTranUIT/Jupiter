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

class Router {
    
    // MARK: Private
    private unowned let coordinator: ViewModelCoordinatorType
    private let navigationController = UINavigationController()
    
    // MARK: Init
    init(coordinator: ViewModelCoordinatorType) {
        self.coordinator = coordinator
        setupSideMenu()
    }
    
    // MARK: Public
    func initMainWindow() -> UIWindow {
        
        // Warp
        let controller = controllerForRouter(type: .home)
        navigationController.viewControllers = [controller]
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        return window
    }
    
    // MARK: Private
    private func binding() {
        self.coordinator.appViewModel.output.handleURLSchemeCallback = {[unowned self] scheme in
            let router = scheme.urlType.toRouter()
            guard router != .none else { return }
            let controller = self.controllerForRouter(type: router)
            self.pushViewController(controller)
        }
    }
    
    private func pushViewController(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
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
            return controller
            
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
