//
//  FViewModel.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 11.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

class FViewModel {
    
    var flowDelegate: FCoordinator!
    
    init(flowDelegate: FCoordinator) {
        self.flowDelegate = flowDelegate
    }
}
