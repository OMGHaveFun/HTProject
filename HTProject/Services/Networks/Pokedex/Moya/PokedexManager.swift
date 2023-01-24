//
//  PokedexManager.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import Foundation
import Moya

final class PokedexManager: PokedexManagerProtocol {
    static let shared = PokedexManager()

    private static let loggerData: (Any) -> String = { _ in return "formatted request body" }
    private static let loggerFormatter = NetworkLoggerPlugin.Configuration.Formatter(requestData: loggerData)
    private static let loggerPlugin = NetworkLoggerPlugin(configuration: .init(formatter: loggerFormatter, logOptions: .verbose))

    var provider = MoyaProvider<PokedexTarget>(plugins: [] /*[loggerPlugin]*/)

    func fetchPokemonList(model: Encodable, completion: @escaping (Result<PokemonListResponse, Error>) -> Void) {
        request(target: .pokemonList(model: model), completion: completion)
    }

    func fetchPokemon(pokemonId: Int, completion: @escaping (Result<PokemonResponse, Error>) -> Void) {
        request(target: .pokemon(pokemonId: pokemonId), completion: completion)
    }

    func fetchPokemonByLink(_ link: String, completion: @escaping (Result<PokemonResponse, Error>) -> Void) {
        request(target: .pokemonByLink(link), completion: completion)
    }

    func fetchPokemonSpecies(pokemonId: Int, completion: @escaping (Result<PokemonSpeciesResponse, Error>) -> Void) {
        request(target: .pokemonSpecies(pokemonId: pokemonId), completion: completion)
    }
}

private extension PokedexManager {
    private func request(target: PokedexTarget, completion: @escaping (Result<Bool, Error>) -> Void) {
        provider.request(target) { result in
            switch result {
            case .success:
                completion(.success(true))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    private func request<T: Decodable>(target: PokedexTarget, completion: @escaping (Result<T, Error>) -> Void) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let results = try decoder.decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
