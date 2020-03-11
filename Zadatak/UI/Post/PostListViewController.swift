//
//  PostListViewController.swift
//  Zadatak
//
//  Created by dejan kraguljac on 11/03/2020.
//

import UIKit
import RxCocoa
import RxSwift

class PostListViewController: MVVMViewController<PostListVM> {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.registerCellNib(ofType: PostCell.self)
        super.viewDidLoad()
    }
    
    override func bindInput() -> PostListVM.Input {
        return PostListVM.Input()
    }
    
    override func bindOuput(_ output: PostListVM.Output) {
        output.posts.drive(tableView.rx.items(cellIdentifier: PostCell.reuseId, cellType: PostCell.self)) { _, model, cell in
            cell.configure(with: model)
        }.disposed(by: disposeBag)
    }
}
