//
//  InitialViewModel.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 06.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

class InitialViewModel {
    var flowDelegate: InitialCoordinator!
    
    init(flowDelegate: InitialCoordinator) {
        self.flowDelegate = flowDelegate
    }
}
