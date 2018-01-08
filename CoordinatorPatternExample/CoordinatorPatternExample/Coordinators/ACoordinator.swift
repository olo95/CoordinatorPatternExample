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
    
    var aViewController: AViewController {
        let vm = AViewModel(flowDelegate: self)
        return AViewController(viewModel: vm)
    }
    
    required init(parent: Coordinating?) {
        self.parent = parent
    }
    
    func start() {
        navigationController.viewControllers = [aViewController]
    }
    
    
}
