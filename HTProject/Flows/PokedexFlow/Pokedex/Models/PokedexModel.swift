//
//  PokedexModel.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import Foundation

struct PokedexModel {
    enum State {
        case display(DisplayModel)
        case shimmers(ShimmersModel)
        case data(FetchDataModel)
        case alert(AlertModel)
        case error(ErrorModel)
    }

    struct DisplayModel {
        let title: String
    }

    struct ShimmersModel {
        let isOn: Bool
    }

    struct FetchDataModel {
        let item: PokedexItem
    }

    struct PokedexItem {
        let items: [PokemonItem]
    }

    struct AlertModel {
        let title: String?
        let message: String?
        let buttonTitle: String
    }

    struct ErrorModel {
        let title: String?
        let message: String?
        let buttonTitle: String
    }

    struct PokemonItem {
        let id: Int
        let number: String
        let name: String
        let tags: [String]
        let image: String
        let type: PokemonType
    }
}
