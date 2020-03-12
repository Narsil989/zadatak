//
//  SceneCoordinatorType.swift
//  Zadatak
//
//  Created by dejan kraguljac on 09/03/2020.
//

import UIKit

typealias VoidCompletion = (() -> Void)?

protocol SceneCoordinatorType {
    
    var currentViewController: UIViewController! { get set }
    
    func transition(to scene: Scene, transitionType: SceneTransition, completion: VoidCompletion)
    
    func pop(_ toRoot: Bool, animated: Bool, completion: VoidCompletion)
    
    func push(animated: Bool, completion: VoidCompletion)
    
}

extension SceneCoordinatorType {
    
    func transition(to scene: Scene, transitionType: SceneTransition = .root(true), completion: VoidCompletion = nil) {
        transition(to: scene, transitionType: transitionType, completion: completion)
    }
    
    func pop(_ toRoot: Bool = false, animated: Bool = true, completion: VoidCompletion = nil) {
        pop(toRoot, animated: animated, completion: completion)
    }
    
    
    func push(animated: Bool, completion: VoidCompletion) {
        push(animated: animated, completion: completion)
    }
}
