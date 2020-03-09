//
//  SceneCoordinator.swift
//  Zadatak
//
//  Created by dejan kraguljac on 09/03/2020.
//
import UIKit

final class SceneCoordinator: SceneCoordinatorType {
    
    private var window: UIWindow
    var currentViewController: UIViewController!
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func transition(to scene: Scene, transitionType: SceneTransition = .root(true), completion: VoidCompletion = nil) {
        transition(to: scene.viewController, type: transitionType, completion: completion)
    }
    
    func transition(to viewController: UIViewController, type: SceneTransition, completion: VoidCompletion) {
        switch type {
        case let .root(animated):
            window.rootViewController = viewController
            window.makeKeyAndVisible()
            completion?()
        default:
            print("will update")
        }
    }
}
