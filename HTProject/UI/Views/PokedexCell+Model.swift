//
//  PokedexCell+Model.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

extension PokedexCell {
    struct Model {
        let item: PokemonListItemResponse
        var callbackAction: ((Model) -> Void)?
    }
}
