//
//  ViewModelType.swift
//  Zadatak
//
//  Created by dejan kraguljac on 09/03/2020.
//

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
