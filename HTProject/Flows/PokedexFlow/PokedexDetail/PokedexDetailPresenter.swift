//
//  PokedexDetailPresenter.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import Foundation

protocol PokedexDetailPresenterDelegate: AnyObject {
    func userNeedsBack()
}

final class PokedexDetailPresenter {
    weak var delegate: PokedexDetailPresenterDelegate?
    weak var view: PokedexDetailViewProtocol?
    private var model: PokedexDetailModel
    private let networkManager: PokedexManagerProtocol

    init(view: PokedexDetailViewProtocol?, model: PokedexDetailModel, networkManager: PokedexManagerProtocol) {
        self.view = view
        self.model = model
        self.networkManager = networkManager
    }
}

private extension PokedexDetailPresenter {
    func fetchPokemon() {
        networkManager.fetchPokemon(pokemonId: model.pokemonId) { [weak self] result in
            guard let self else { return }

            switch result {
            case .success(let response):
                print("Response: ", response)
                self.view?.display(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension PokedexDetailPresenter: PokedexDetailPresenterProtocol {
    func onViewDidLoad() {
        view?.display(model: model)
    }

    func onViewWillAppear() {
        fetchPokemon()
    }

    func handleBackTap() {
        delegate?.userNeedsBack()
    }
}
