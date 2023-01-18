//
//  PokedexModel.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import Foundation

struct PokedexModel {
    let title: String
    let alert: PokedexAlertModel
}

struct PokedexAlertModel {
    let title: String?
    let message: String?
    let buttonTitle: String
}
