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
    
    var bViewController: CViewController {
        let vm = CViewModel(flowDelegate: self)
        return CViewController(viewModel: vm)
    }
    
    required init(parent: Coordinating?) {
        self.parent = parent
    }
    
    func start() {
        navigationController.viewControllers = []
    }
}

