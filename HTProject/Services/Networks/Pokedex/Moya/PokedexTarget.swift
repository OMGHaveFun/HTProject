//
//  PokedexTarget.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import Foundation
import Moya

enum PokedexTarget {
    case pokemonList(model: Encodable)
    case pokemon(pokemonId: Int)
    case pokemonSpecies(pokemonId: Int)
}

extension PokedexTarget: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Routes.baseURL + Routes.versionPrefix) else { fatalError() }
        return url
    }

    var path: String {
        switch self {
        case .pokemonList:
            return Routes.pokemonList
        case .pokemon(let pokemonId):
            return String(format: Routes.pokemon, pokemonId)
        case .pokemonSpecies(let pokemonId):
            return String(format: Routes.pokemonSpecies, pokemonId)
        }
    }

    var method: Moya.Method {
        switch self {
        case .pokemonList, .pokemon, .pokemonSpecies:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .pokemonList(let model):
            guard let model = model as? PokemonListDTO else { return .requestPlain }
            return .requestParameters(parameters: ["offset": model.offset,
                                                   "limit": model.limit],
                                      encoding: URLEncoding(destination: .queryString, arrayEncoding: .noBrackets))
        case .pokemon, .pokemonSpecies:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        return nil
    }
}
