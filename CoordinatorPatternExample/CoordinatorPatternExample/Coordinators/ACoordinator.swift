//
//  ACoordinator.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 06.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

class ACoordinator: Coordinating {
    
    var navigationController: UINavigationController = {
        return UINavigationController()
    }()
    var childCoordinators: [Coordinating] = []
    var parent: Coordinating?
    
    let transitionManager: TransitionManager!
    
    var aViewController: AViewController {
        let vm = AViewModel(flowDelegate: self)
        return AViewController(viewModel: vm)
    }
    
    required init(parent: Coordinating?) {
        self.parent = parent
        transitionManager = TransitionManager(originFrame: navigationController.view.frame)
    }
    
    func start() {
        let aViewController = self.aViewController
        navigationController.transitioningDelegate = transitionManager
        navigationController.viewControllers = [aViewController]
    }
    
    func takeToFCoordinator() {
        addNew(coordinator: FCoordinator(parent: self), fromRoot: false, completionHandler: nil)
    }
}

extension ACoordinator: DrawerCoordinatorDelegate {
    
    func showDrawer() {
        let drawerCoordinator = DrawerCoordinator(parent: self, navigationController: navigationController)
        drawerCoordinator.start()
    }
}
