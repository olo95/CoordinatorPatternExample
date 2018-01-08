//
//  DrawerViewController.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 06.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

class DrawerViewController: UIViewController {

    @IBOutlet weak var drawerView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var aButton: UIButton!
    
    var viewModel: DrawerViewModel!
    
    init(viewModel: DrawerViewModel) {
        super.init(nibName: DrawerViewController.typeName, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissDrawer)))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc
    func dismissDrawer() {
        viewModel.flowDelegate.stop()
    }
}
