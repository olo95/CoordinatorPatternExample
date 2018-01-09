//
//  DrawerCoordinator.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 06.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

enum DrawerChoice {
    case A, B, C
}

protocol DrawerCoordinatorDelegate {
    func showDrawer()
}

class DrawerCoordinator: Coordinating {
    var navigationController: UINavigationController = UINavigationController()
    var childCoordinators: [Coordinating] = []
    var parent: Coordinating?
    
    let drawerTransitionManager: DrawerTransitionManager!
    var drawer: DrawerViewController!
    
    required init(parent: Coordinating?) {
        self.parent = parent
        drawerTransitionManager = DrawerTransitionManager(originFrame: navigationController.view.frame)
    }
    
    init(parent: Coordinating?, navigationController: UINavigationController) {
        self.parent = parent
        self.navigationController = navigationController
        drawerTransitionManager = DrawerTransitionManager(originFrame: navigationController.view.frame)
    }
    
    func start() {
        drawer = DrawerViewController(viewModel: DrawerViewModel(flowDelegate: self))
        drawer.transitioningDelegate = drawerTransitionManager
        present(viewController: drawer, completionHandler: nil)
    }
    
    func stop() {
        drawer.dismiss(animated: true)
    }
    
    func drawerButtonTapped(with choice: DrawerChoice) {
        switch choice {
        case .A:
            addNew(coordinator: ACoordinator(parent: rootCoordinator), fromRoot: true, completionHandler: nil)
        case .B:
            addNew(coordinator: ACoordinator(parent: rootCoordinator), fromRoot: true, completionHandler: nil)
        case .C:
            addNew(coordinator: ACoordinator(parent: rootCoordinator), fromRoot: true, completionHandler: nil)
        }
    }
}
