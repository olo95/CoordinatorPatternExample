//
//  CCoordinator.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 06.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

class CCoordinator: Coordinating {
    
    var navigationController: UINavigationController = {
        return UINavigationController()
    }()
    var childCoordinators: [Coordinating] = []
    var parent: Coordinating?
    
    var transitionManager: TransitionManager!
    
    var bViewController: CViewController {
        let vm = CViewModel(flowDelegate: self)
        return CViewController(viewModel: vm)
    }
    
    required init(parent: Coordinating?) {
        self.parent = parent
        transitionManager = TransitionManager(originFrame: navigationController.view.frame)
    }
    
    func start() {
        navigationController.transitioningDelegate = transitionManager
        navigationController.viewControllers = [bViewController]
    }
    
    func takeToDCoordinator() {
        addNew(coordinator: DCoordinator(parent: self), fromRoot: false, completionHandler: nil)
    }
}

extension CCoordinator: DrawerCoordinatorDelegate {
    
    func showDrawer() {
        let drawerCoordinator = DrawerCoordinator(parent: self, navigationController: navigationController)
        drawerCoordinator.start()
    }
}
