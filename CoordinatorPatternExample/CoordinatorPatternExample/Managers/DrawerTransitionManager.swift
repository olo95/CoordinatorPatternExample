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
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to),
            let snapshot = toVC.view.snapshotView(afterScreenUpdates: true)
            else {
                return
        }
        
        let containerView = transitionContext.containerView
        
        toVC.view.frame = CGRect(x: toVC.view.frame.origin.x - 1/2 * toVC.view.frame.origin.x, y: toVC.view.frame.origin.y, width: toVC.view.frame.width, height: toVC.view.frame.height)
        
        snapshot.frame = CGRect(x: 0 - originFrame.origin.x, y: originFrame.origin.y, width: originFrame.width, height: originFrame.height)
        snapshot.layer.masksToBounds = true
        
        containerView.addSubview(toVC.view)
        containerView.addSubview(snapshot)
        toVC.view.isHidden = true
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration
            , animations: {
                snapshot.frame = CGRect(x: snapshot.frame.origin.x + 1/2 * self.originFrame.origin.x, y: self.originFrame.origin.y, width: self.originFrame.width, height: self.originFrame.height)
        }, completion: { _ in
            toVC.view.isHidden = false
            snapshot.removeFromSuperview()
            fromVC.view.layer.transform = CATransform3DIdentity
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
