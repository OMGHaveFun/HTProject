//
//  PokedexManagerProtocol.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

protocol PokedexManagerProtocol {
    func fetchPokemonList(model: Encodable, completion: @escaping (Result<PokemonListResponse, Error>) -> Void)
    func fetchPokemon(pokemonId: Int, completion: @escaping (Result<PokemonResponse, Error>) -> Void)
    func fetchPokemonSpecies(pokemonId: Int, completion: @escaping (Result<PokemonSpeciesResponse, Error>) -> Void)

}
