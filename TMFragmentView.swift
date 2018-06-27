//
//  TMFragmentView.swift
//  AgentApp
//
//  Created by Vsevolod Sevostyanov on 27/06/2018.
//  Copyright © 2018 Vsevolod Sevostyanov. All rights reserved.
//

import UIKit

class TMFragmentView: UIViewController, TMProtocol {
    private weak var transitionManager: TransitionManager!

    required override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName:nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setTransitionManager(manager: TransitionManager) {
        self.transitionManager = manager
    }
    
    func getTransitionManager() -> TransitionManager {
        return self.transitionManager
    }
}
