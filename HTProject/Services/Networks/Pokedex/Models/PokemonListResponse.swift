//
//  PokemonListResponse.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

import Foundation

struct PokemonListResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonListItemResponse]
}

struct PokemonListItemResponse: Decodable {
    let name: String
    let url: String
}
