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
        case let .push(animated):
            guard let navigationController = currentViewController.navigationController else {
                fatalError("There is no navigation stack to push new VC")
            }
            navigationController.pushViewController(viewController, animated: animated)
            completion?()
        default:
            print("will update")
        }
        currentViewController = viewController.actualViewController()
    }
    
    func pop(_ toRoot: Bool = false, animated: Bool = true, completion: VoidCompletion = nil) {
        if let navigationViewController = currentViewController.navigationController, navigationViewController.viewControllers.isEmpty == false {
            navigationViewController.popViewController(animated: true)
            self.currentViewController = navigationViewController.viewControllers.last!
        } else {
            self.window.rootViewController?.dismiss(animated: animated, completion: completion)
            self.currentViewController = window.rootViewController
        }
        
    }
}
