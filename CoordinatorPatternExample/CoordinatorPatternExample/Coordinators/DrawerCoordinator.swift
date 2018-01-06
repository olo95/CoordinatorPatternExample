//
//  DrawerCoordinator.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 06.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

class DrawerCoordinator: Coordinating {
    var navigationController: UINavigationController = UINavigationController()
    var childCoordinators: [Coordinating] = []
    var parent: Coordinating?
    
    required init(parent: Coordinating?) {
        self.parent = parent
    }
    
    func start() {
        
    }
    
    init(parent: Coordinating?, navigationController: UINavigationController) {
        self.parent = parent
        self.navigationController = navigationController
    }
    
    
}
