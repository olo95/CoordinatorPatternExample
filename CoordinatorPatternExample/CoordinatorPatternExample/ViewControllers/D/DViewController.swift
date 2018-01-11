//
//  DViewController.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 10.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

class DViewController: UIViewController {
    
    @IBOutlet weak var bButton: UIButton!
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
        setupActions()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupActions() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Menu", style: .done, target: self, action: #selector(showDrawer))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(dismissView))
        
        bButton.addTarget(self, action: #selector(bButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func showDrawer() {
        guard let flowDelegate = viewModel.flowDelegate as? DrawerCoordinatorDelegate else {
            return
        }
        
        flowDelegate.showDrawer()
    }
    
    @objc
    private func dismissView() {
        viewModel.flowDelegate.dismiss(viewController: navigationController!, completionHandler: nil)
    }
    
    @objc
    private func bButtonTapped() {
        viewModel.flowDelegate.takeToBCoordinator()
    }
}
