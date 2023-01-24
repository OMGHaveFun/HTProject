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
    let types: [PokemonTypesResponse]
}

struct PokemonSpritesResponse: Decodable {
    let backDefault: String?
    let frontDefault: String?
}

struct PokemonTypesResponse: Decodable {
    let slot: Int?
    let type: PokemonTypeResponse?
}

struct PokemonTypeResponse: Decodable {
    let name: String?
    let url: String?
}
