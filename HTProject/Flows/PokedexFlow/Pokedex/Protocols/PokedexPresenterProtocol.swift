//
//  PokedexPresenterProtocol.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

protocol PokedexPresenterProtocol: AnyObject {
    func onViewDidLoad()
    func handleBackTap()
    func handleMenuTap()
    func handlePokemonTap()
}
