//
//  MVVMViewController.swift
//  Zadatak
//
//  Created by dejan kraguljac on 09/03/2020.
//
import UIKit
import RxSwift
import RxCocoa

class MVVMViewController<T: ViewModelType>: UIViewController {
    var viewModel: T
    var disposeBag = DisposeBag()
    var coordinatorType: SceneCoordinatorType
    
    var transition: Binder<Scene> {
        return Binder(self) { controller, scene in
            controller.coordinatorType.transition(to: scene, transitionType: .push(true))
        }
    }
    
    required init(coordinatorType: SceneCoordinatorType, viewModel: T) {
        self.viewModel = viewModel
        self.coordinatorType = coordinatorType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindOuput(viewModel.transform(input: bindInput()))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let actualController = actualViewController()
        if actualController != coordinatorType.currentViewController {
            coordinatorType.currentViewController = actualController
        }
    }
    
    func bindInput() -> T.Input {
        fatalError("bindInput not implemented")
    }
    
    func bindOuput(_ output: T.Output) {
        fatalError("bindoutput not implemented")
    }
}
