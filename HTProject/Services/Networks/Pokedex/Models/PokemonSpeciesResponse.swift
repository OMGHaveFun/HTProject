//
//  PokemonSpeciesResponse.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 18/01/2023.
//

import Foundation

struct PokemonSpeciesResponse: Decodable {
    let id: Int
    let isBaby: Bool
    let isLegendary: Bool
    let isMythical: Bool
    let color: PokemonColorResponse?
}

struct PokemonColorResponse: Decodable {
    let name: String?
    let url: String?
}
