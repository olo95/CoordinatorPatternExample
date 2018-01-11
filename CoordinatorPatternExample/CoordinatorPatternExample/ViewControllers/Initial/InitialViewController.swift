//
//  InitialViewController.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 06.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var aButton: UIButton!
    var viewModel: InitialViewModel!
    
    init(viewModel: InitialViewModel) {
        super.init(nibName: InitialViewController.typeName, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupActions() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .done, target: self, action: #selector(showDrawer))
        
        aButton.addTarget(self, action: #selector(aButtonTapped), for: .touchUpInside)
        bButton.addTarget(self, action: #selector(bButtonTapped), for: .touchUpInside)
        cButton.addTarget(self, action: #selector(cButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func showDrawer() {
        guard let flowDelegate = viewModel.flowDelegate as? DrawerCoordinatorDelegate else {
            return
        }
        
        flowDelegate.showDrawer()
    }
    
    @objc
    private func aButtonTapped() {
        viewModel.flowDelegate.takeToACoordinator()
    }
    
    @objc
    private func bButtonTapped() {
        viewModel.flowDelegate.takeToBCoordinator()
    }
    
    @objc
    private func cButtonTapped() {
        viewModel.flowDelegate.takeToCCoordinator()
    }
}
