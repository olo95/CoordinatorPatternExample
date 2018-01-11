//
//  BCoordinator.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 06.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

class BCoordinator: Coordinating {
    
    var navigationController: UINavigationController = {
       return UINavigationController()
    }()
    var childCoordinators: [Coordinating] = []
    var parent: Coordinating?
    
    var transitionManager: TransitionManager!
    
    var bViewController: BViewController {
        let vm = BViewModel(flowDelegate: self)
        return BViewController(viewModel: vm)
    }
    
    required init(parent: Coordinating?) {
        self.parent = parent
        transitionManager = TransitionManager(originFrame: navigationController.view.frame)
    }
    
    func start() {
        navigationController.transitioningDelegate = transitionManager
        navigationController.viewControllers = [bViewController]
    }
    
    func takeToFCoordinator() {
        addNew(coordinator: FCoordinator(parent: self), fromRoot: false, completionHandler: nil)
    }
    
    func takeToECoordinator() {
        addNew(coordinator: ECoordinator(parent: self), fromRoot: false, completionHandler: nil)
    }
}

extension BCoordinator: DrawerCoordinatorDelegate {
    
    func showDrawer() {
        let drawerCoordinator = DrawerCoordinator(parent: self, navigationController: navigationController)
        drawerCoordinator.start()
    }
}
