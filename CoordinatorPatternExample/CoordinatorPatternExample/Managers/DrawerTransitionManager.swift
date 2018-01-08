//
//  DrawerTransitionManager.swift
//  CoordinatorPatternExample
//
//  Created by Alexander Stolar on 06.01.2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

class DrawerTransitionManager: NSObject {
    
    var originFrame: CGRect!
    
    init(originFrame: CGRect) {
        self.originFrame = originFrame
    }
}

extension DrawerTransitionManager: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if let _ = transitionContext.viewController(forKey: .to) as? DrawerViewController { // Drawer is appearing
            show(using: transitionContext)
        } else if let _ = transitionContext.viewController(forKey: .from) as? DrawerViewController { // Drawer is disappearing
            hide(using: transitionContext)
        }
    }
    
    func show(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to) as? DrawerViewController,
            let snapshot = toVC.view.snapshotView(afterScreenUpdates: true)
            else {
                return
        }
        let fromVCView = fromVC.view.snapshotView(afterScreenUpdates: true)!
        let containerView = transitionContext.containerView
        
        snapshot.frame = CGRect(x: 0 - originFrame.width, y: originFrame.origin.y, width: originFrame.width, height: originFrame.height)
        snapshot.layer.masksToBounds = true
        
        containerView.addSubview(toVC.view)
        containerView.addSubview(snapshot)
        toVC.view.isHidden = true
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration
            , animations: {
                snapshot.frame = toVC.view.frame
        }, completion: { _ in
            toVC.view.isHidden = false
            toVC.backgroundView.addSubview(fromVCView)
            snapshot.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
    func hide(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as? DrawerViewController,
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
                return
        }
        
        let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            fromVC.drawerView.frame.origin.x -= fromVC.drawerView.frame.width
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}

extension DrawerTransitionManager: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented _: UIViewController, presenting _: UIViewController, source _: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forDismissed _: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}
