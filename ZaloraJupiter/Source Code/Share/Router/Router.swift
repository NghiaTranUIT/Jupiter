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
        binding()
    }
    
    // MARK: Public
    func initMainWindow() -> UIWindow {
        
        // Warp
        let controller = controllerForRouter(type: .home(nil))
        navigationController.viewControllers = [controller]
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        return window
    }
    
    // MARK: Private
    private func binding() {
        self.coordinator.appViewModel.output.handleURLSchemeCallback = {[unowned self] scheme in
            
            // Create router with scheme
            let router = RouterType(scheme: scheme)
            
            // Create and push
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
        
        case .catalog(let scheme):
            let controller = CatalogViewController(nibName: "CatalogViewController", bundle: nil)
            controller.viewModel = coordinator.catalogViewModel
            controller.scheme = scheme
            return controller
            
        case .menu:
            let controller = MenuViewController(nibName: "MenuViewController", bundle: nil)
            return controller
            
        default: // Didn't support yet
            fatalError()
        }
    }
    
    fileprivate func setupSideMenu() {
        let home = UISideMenuNavigationController(rootViewController: controllerForRouter(type: .menu(nil)))
        SideMenuManager.defaultManager.menuLeftNavigationController = home
    }
}
