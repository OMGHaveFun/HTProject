//
//  PokedexDetailPresenterProtocol.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

protocol PokedexDetailPresenterProtocol: AnyObject {
    func onViewDidLoad()
    func onViewWillAppear()

    func handleBackTap()
    func handleLikeTap()
}
