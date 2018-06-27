//
//  TransitionManager.swift
//  AgentApp
//
//  Created by Vsevolod Sevostyanov on 25/06/2018.
//  Copyright © 2018 Vsevolod Sevostyanov. All rights reserved.
//

import UIKit

class TransitionManager {
    private var parent: UIViewController
    private var container: UIView
    private var viewStack: Stack<UIViewController> = Stack<UIViewController>()
    private var lastController: UIViewController? = nil;
    
    required init(parentViewController: UIViewController, container: UIView) {
        self.parent = parentViewController
        self.container = container
    }
    
    func pushController(controller: UIViewController, withHistory: Bool) {
        if(withHistory) {
            viewStack.push(controller)
            if(!viewStack.isEmpty) {
                removeController(viewController: viewStack.peek()!);
            }
            addController(viewController: controller)
        } else {
            viewStack.clear()
            if(lastController != nil) {
                removeController(viewController: lastController!);
            }
            lastController = controller
            addController(viewController: controller);
        }
    }
    
    func popBack() {
        if(!viewStack.isEmpty) {
            removeController(viewController: viewStack.pop()!)
            if(viewStack.isEmpty) {
                addController(viewController: lastController!)
            } else {
                addController(viewController: viewStack.peek()!)
            }
        }
    }
    
    func getMainController() -> UIViewController {
        return parent
    }
    
//    func findControllerByIndex() {
//
//    }
    
    func findIndexByTag() {

    }
    
    
    private func removeController(viewController: UIViewController) {
        viewController.willMove(toParentViewController: self.parent)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
    
    private func addController(viewController: UIViewController) {
        // Add Child View Controller
        self.parent.addChildViewController(viewController)
        
        // Add Child View as Subview
        self.container.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = self.container.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        if(viewController is TMProtocol) {
            (viewController as? TMProtocol)?.setTransitionManager(manager: self)
        }
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self.parent)
    }
}
