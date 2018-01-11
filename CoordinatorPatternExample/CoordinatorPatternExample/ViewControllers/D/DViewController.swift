//
//  DViewController.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 10.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

class DViewController: UIViewController {
    
    var viewModel: DViewModel!
    
    init(viewModel: DViewModel) {
        super.init(nibName: DViewController.typeName, bundle: nil)
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
