//
//  BViewController.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 06.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    
    var viewModel: BViewModel!
    
    init(viewModel: BViewModel) {
        super.init(nibName: BViewController.typeName, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
