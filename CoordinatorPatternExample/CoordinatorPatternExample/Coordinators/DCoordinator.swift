//
//  DCoordinator.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 11.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

class DCoordinator: Coordinating {
    var navigationController: UINavigationController = {
        return UINavigationController()
    }()
    var childCoordinators: [Coordinating] = []
    var parent: Coordinating?
    
    var transitionManager: TransitionManager!
    
    var dViewController: DViewController {
        let vm = DViewModel(flowDelegate: self)
        return DViewController(viewModel: vm)
    }
    
    required init(parent: Coordinating?) {
        self.parent = parent
        transitionManager = TransitionManager(originFrame: navigationController.view.frame)
    }
    
    func start() {
        navigationController.transitioningDelegate = transitionManager
        navigationController.viewControllers = [dViewController]
    }
    
    func takeToBCoordinator() {
        addNew(coordinator: BCoordinator(parent: self), fromRoot: false, completionHandler: nil)
    }
}

extension DCoordinator: DrawerCoordinatorDelegate {
    
    func showDrawer() {
        let drawerCoordinator = DrawerCoordinator(parent: self, navigationController: navigationController)
        drawerCoordinator.start()
    }
}

