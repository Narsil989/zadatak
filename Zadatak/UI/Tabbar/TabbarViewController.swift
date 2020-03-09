//
//  TabbarViewController.swift
//  Zadatak
//
//  Created by dejan kraguljac on 09/03/2020.
//

import UIKit

class TabbarViewController: UITabBarController {

    var viewModel: TabbarVM
    var coordinatorType: SceneCoordinatorType
    
    required init(coordinatorType: SceneCoordinatorType, viewModel: TabbarVM) {
        self.viewModel = viewModel
        self.coordinatorType = coordinatorType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
