//
//  Constants.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

struct Routes {
    static let baseURL = "https://pokeapi.co/api"
    static let versionPrefix = "/v2"

    static let pokemonList = "/pokemon"
    static let pokemon = "/pokemon/%d"
    static let pokemonSpecies = "/pokemon-species/%d"
}

enum PokemonType: String, CaseIterable {
    case normal
    case fighting
    case flying
    case poison
    case ground
    case rock
    case bug
    case ghost
    case steel
    case fire
    case water
    case grass
    case electric
    case psychic
    case ice
    case dragon
    case dark
    case fairy
    case unknown
    case shadow

    static func withLabel(_ label: String) -> PokemonType? {
        return self.allCases.first { $0.rawValue == label }
    }
}
