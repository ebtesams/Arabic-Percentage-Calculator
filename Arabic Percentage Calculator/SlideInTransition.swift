//
//  SlideInTransition.swift
//  Arabic Percentage Calculator
//
//  Created by Ebtesam on 04/08/1440 AH.
//  Copyright © 1440 Ebtesam. All rights reserved.
//

import UIKit

class SlideInTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var isPresenting = false
    let dimmingView = UIView()
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else { return }
        
        let containerView = transitionContext.containerView
        
        let finalWidth = toViewController.view.bounds.width * 0.7
        let finalHeight = toViewController.view.bounds.height
        
        if isPresenting {
            // Add dimming view
            dimmingView.backgroundColor = .black
            dimmingView.alpha = 0.0
            containerView.addSubview(dimmingView)
            dimmingView.frame = containerView.bounds
            // Add menu view controller to container
            containerView.addSubview(toViewController.view)
            
            // Init frame off the screen
            toViewController.view.frame = CGRect(x: finalWidth, y: 0, width: finalWidth, height: finalHeight)
          
            
           
        }
        
        // Move back off screen
        let identity = {
            self.dimmingView.alpha = 0.0
            fromViewController.view.transform = CGAffineTransform(translationX:  160 , y: 0)
            
        }
        
        // Move on screen
        let transform = {
            self.dimmingView.alpha = 0.5
            toViewController.view.transform = CGAffineTransform(translationX:  -160 , y: 0)
            self.dimmingView.isUserInteractionEnabled = true;
             func touchesBegan(_ touches: Set<UITouch>, withEvent event: UIEvent) {
                var touch: UITouch? = touches.first
               identity()
                //location is relative to the current view
                // do something with the touched point
                if touch?.view != self.dimmingView {
                    self.dimmingView.isHidden = true
                }
            }
        }
        
        
       
        
        // Animation of the transition
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration, animations: {
            self.isPresenting ? transform() : identity()
        }) { (_) in
            transitionContext.completeTransition(!isCancelled)
        }
    }
    
}

