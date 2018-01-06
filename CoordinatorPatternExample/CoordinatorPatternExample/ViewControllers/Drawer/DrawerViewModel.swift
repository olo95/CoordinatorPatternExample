//
//  DrawerViewModel.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 06.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

class DrawerViewModel {
    
    var flowDelegate: DrawerCoordinator!
    
    init(flowDelegate: DrawerCoordinator) {
        self.flowDelegate = flowDelegate
    }
    
}
