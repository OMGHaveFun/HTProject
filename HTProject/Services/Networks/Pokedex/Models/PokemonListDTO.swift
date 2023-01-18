//
//  PokemonListDTO.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import Foundation

struct PokemonListDTO: Encodable {
    let offset: Int
    let limit: Int
}
