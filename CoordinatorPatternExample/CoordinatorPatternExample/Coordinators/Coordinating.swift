//
//  Coordinating.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 06.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

protocol Coordinating: class {
    var navigationController: UINavigationController { get }
    var childCoordinators: [Coordinating] { get set }
    var rootCoordinator: Coordinating { get }
    var parent: Coordinating? { get set }
    
    init(parent: Coordinating?)
    func start()
    
    func addNew(coordinator: Coordinating, fromRoot: Bool, completionHandler: (() -> ())?)
    
    func push(viewController: UIViewController, completionHandler: (() -> ())?)
    func pop(completionHandler: (() -> ())?)
    func present(viewController: UIViewController, completionHandler: (() -> ())?)
    func dismiss(viewController: UIViewController, completionHandler: (() -> ())?)
}

extension Coordinating {
    
    var rootCoordinator: Coordinating {
        if let parent = parent {
            return parent.rootCoordinator
        } else {
            return self
        }
    }
    
    func addNew(coordinator: Coordinating, fromRoot: Bool, completionHandler: (() -> ())?) {
        if fromRoot {
            if let parent = parent {
                self.childCoordinators.removeAll()
                navigationController.dismiss(animated: true) {
                    parent.addNew(coordinator: coordinator, fromRoot: fromRoot) {
                        completionHandler?()
                    }
                }
            } else {
                self.childCoordinators.append(coordinator)
                coordinator.start()
                present(viewController: coordinator.navigationController) {
                    completionHandler?()
                }
            }
        } else {
            self.childCoordinators.append(coordinator)
            coordinator.start()
            present(viewController: coordinator.navigationController) {
                completionHandler?()
            }
        }
    }
    
    func push(viewController: UIViewController, completionHandler: (() -> ())?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completionHandler)
        navigationController.pushViewController(viewController, animated: true)
        CATransaction.commit()
    }
    
    func pop(completionHandler: (() -> ())?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completionHandler)
        navigationController.popViewController(animated: true)
        CATransaction.commit()
    }
    
    func present(viewController: UIViewController, completionHandler: (() -> ())?) {
        navigationController.present(viewController, animated: true) {
            completionHandler?()
        }
    }
    
    func dismiss(viewController: UIViewController, completionHandler: (() -> ())?) {
        viewController.dismiss(animated: true) {
            completionHandler?()
        }
    }
}
