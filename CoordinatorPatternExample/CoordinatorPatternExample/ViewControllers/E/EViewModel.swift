//
//  EViewModel.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 11.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

class EViewModel {
    
    var flowDelegate: ECoordinator!
    
    init(flowDelegate: ECoordinator) {
        self.flowDelegate = flowDelegate
    }
}
