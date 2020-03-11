//
//  UITableView+Ext.swift
//  Zadatak
//
//  Created by dejan kraguljac on 11/03/2020.
//

import UIKit

extension UITableView {
    func dequeReusableCell<T: UITableViewCell>(ofType cellType: T.Type = T.self, at indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseId, for: indexPath) as? T else {
            fatalError("could not register cell of type")
        }
        return cell
    }
    
    func registerCellNib<T: UITableViewCell>(ofType cellType: T.Type = T.self) {
        register(UINib(nibName: cellType.reuseId, bundle: nil), forCellReuseIdentifier: cellType.reuseId)
    }
}
