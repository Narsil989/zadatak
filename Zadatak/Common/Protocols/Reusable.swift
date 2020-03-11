//
//  Reusable.swift
//  Zadatak
//
//  Created by dejan kraguljac on 11/03/2020.
//

protocol Reusable {
    static var reuseId: String { get }
}

extension Reusable {
    static var reuseId: String {
        return String(describing: self)
    }
}
