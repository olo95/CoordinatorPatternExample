//
//  DViewModel.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 10.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

class DViewModel {
    
    var flowDelegate: DCoordinator!
    
    init(flowDelegate: DCoordinator) {
        self.flowDelegate = flowDelegate
    }
}
