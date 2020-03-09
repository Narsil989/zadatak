//
//  SceneTransition.swift
//  Zadatak
//
//  Created by dejan kraguljac on 09/03/2020.
//

import Foundation

enum SceneTransition {
    case push(_ animated: Bool)
    case pop(_ animated: Bool)
    case root(_ animated: Bool)
}
