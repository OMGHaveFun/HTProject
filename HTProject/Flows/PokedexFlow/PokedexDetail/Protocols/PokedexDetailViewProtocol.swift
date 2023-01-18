//
//  PokedexDetailViewProtocol.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

protocol PokedexDetailViewProtocol: AnyObject {
    func display(model: PokedexDetailModel)
    func display(_ pokemon: PokemonResponse)
}
