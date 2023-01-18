//
//  PokemonResponse.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 18/01/2023.
//

import Foundation

struct PokemonResponse: Decodable {
    let id: Int
    let name: String
    let weight: Int
    let height: Int
    let sprites: PokemonSpritesResponse
}

struct PokemonSpritesResponse: Decodable {
    let backDefault: String?
    let frontDefault: String?
}
