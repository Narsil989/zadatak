//
//  Configurable.swift
//  Zadatak
//
//  Created by dejan kraguljac on 11/03/2020.
//

protocol Configurable {
    associatedtype Data
    
    func configure(with data: Data)
}
