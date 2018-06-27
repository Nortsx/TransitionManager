//
//  TMProtocol.swift
//  AgentApp
//
//  Created by Vsevolod Sevostyanov on 27/06/2018.
//  Copyright © 2018 Vsevolod Sevostyanov. All rights reserved.
//

import UIKit

protocol TMProtocol {
    func setTransitionManager(manager: TransitionManager)
    
    func getTransitionManager() -> TransitionManager
}
