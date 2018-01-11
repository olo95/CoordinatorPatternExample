//
//  ECoordinator.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 11.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

class ECoordinator: Coordinating {
    var navigationController: UINavigationController = {
        return UINavigationController()
    }()
    var childCoordinators: [Coordinating] = []
    var parent: Coordinating?
    
    var transitionManager: TransitionManager!
    
    var eViewController: EViewController {
        let vm = EViewModel(flowDelegate: self)
        return EViewController(viewModel: vm)
    }
    
    required init(parent: Coordinating?) {
        self.parent = parent
        transitionManager = TransitionManager(originFrame: navigationController.view.frame)
    }
    
    func start() {
        navigationController.transitioningDelegate = transitionManager
        navigationController.viewControllers = [eViewController]
    }
}
