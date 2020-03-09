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
    
    required init(viewModel: T) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bindInput() -> T.Input {
        fatalError("bindInput not implemented")
    }
    
    func bindOuput(_ output: T.Output) {
        fatalError("bindoutput not implemented")
    }
}
