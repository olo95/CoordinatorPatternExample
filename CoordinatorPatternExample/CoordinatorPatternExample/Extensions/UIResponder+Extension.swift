//
//  UIResponder+Extension.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 06.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

extension UIResponder {
    
    static var typeName: String {
        return String(describing: self)
    }
}
