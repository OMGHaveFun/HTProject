//
//  PokedexDetailModel.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import Foundation

struct PokedexDetailModel {
    enum State {
        case display(DisplayModel)
        case shimmers(ShimmersModel)
        case alert(AlertModel)
    }

    struct DisplayModel {
        let id: Int
        let number: String
        let name: String
        let tags: [String]
        let image: String
        let type: PokemonType
    }

    struct ShimmersModel {
        let isOn: Bool
    }

    struct AlertModel {
        let title: String?
        let message: String?
        let buttonTitle: String
    }
}
