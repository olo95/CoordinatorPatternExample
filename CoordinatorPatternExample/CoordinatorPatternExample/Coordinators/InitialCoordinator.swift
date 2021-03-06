//
//  InitialCoordinator.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 06.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

class InitialCoordinator: Coordinating {
    
    var navigationController: UINavigationController = {
        return UINavigationController()
    }()
    var childCoordinators: [Coordinating] = []
    var parent: Coordinating?
    
    var window: UIWindow!
    var initialViewController: InitialViewController {
        let vm = InitialViewModel(flowDelegate: self)
        return InitialViewController(viewModel: vm)
    }
    
    required init(parent: Coordinating?) {
        self.parent = parent
        window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func start() {
        navigationController.viewControllers = [initialViewController]
    }
    
    func takeToACoordinator() {
        addNew(coordinator: ACoordinator(parent: self), fromRoot: false, completionHandler: nil)
    }
    
    func takeToBCoordinator() {
        addNew(coordinator: BCoordinator(parent: self), fromRoot: false, completionHandler: nil)
    }
    
    func takeToCCoordinator() {
        addNew(coordinator: CCoordinator(parent: self), fromRoot: false, completionHandler: nil)
    }
}

extension InitialCoordinator: DrawerCoordinatorDelegate {
    
    func showDrawer() {
        let drawerCoordinator = DrawerCoordinator(parent: self, navigationController: navigationController)
        drawerCoordinator.start()
    }
}
