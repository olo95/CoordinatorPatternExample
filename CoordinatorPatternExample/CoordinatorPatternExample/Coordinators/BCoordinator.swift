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
    
    var bViewController: BViewController {
        let vm = BViewModel(flowDelegate: self)
        return BViewController(viewModel: vm)
    }
    
    required init(parent: Coordinating?) {
        self.parent = parent
    }
    
    func start() {
        navigationController.viewControllers = []
    }
}

extension BCoordinator: DrawerCoordinatorDelegate {
    
    func showDrawer() {
        let drawerCoordinator = DrawerCoordinator(parent: self, navigationController: navigationController)
        drawerCoordinator.start()
    }
}
