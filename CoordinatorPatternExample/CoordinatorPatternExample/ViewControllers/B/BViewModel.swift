//
//  BViewModel.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 06.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

class BViewModel {
    
    var flowDelegate: BCoordinator!
    
    init(flowDelegate: BCoordinator) {
        self.flowDelegate = flowDelegate
    }
}
