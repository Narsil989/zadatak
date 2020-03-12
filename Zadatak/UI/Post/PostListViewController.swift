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
        self.navigationItem.title = "posts_main_title".localizedUppercase
    }
    
    override func bindInput() -> PostListVM.Input {
        let selected = tableView.rx.itemSelected.asDriver()
        return PostListVM.Input(didSelect: selected)
    }
    
    override func bindOuput(_ output: PostListVM.Output) {
        output.posts.drive(tableView.rx.items(cellIdentifier: PostCell.reuseId, cellType: PostCell.self)) { _, model, cell in
            cell.configure(with: model)
        }.disposed(by: disposeBag)
        output.openDetails.drive(transition).disposed(by: disposeBag)
    }
}
