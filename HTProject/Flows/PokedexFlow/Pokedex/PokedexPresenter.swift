//
//  PokedexPresenter.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

import Foundation

protocol PokedexPresenterDelegate: AnyObject {
    func userNeedsToInit()
    func userNeedsToDetail(pokemonId: Int)
}

final class PokedexPresenter {
    weak var delegate: PokedexPresenterDelegate?
    weak var view: PokedexViewProtocol?
    private var model: PokedexModel
    private let networkManager: PokedexManagerProtocol

    init(view: PokedexViewProtocol?, model: PokedexModel, networkManager: PokedexManagerProtocol) {
        self.view = view
        self.model = model
        self.networkManager = networkManager
    }
}

private extension PokedexPresenter {
    func fetchPokemonList() {
        let networkModel = PokemonListDTO(offset: 0, limit: 20)

        networkManager.fetchPokemonList(model: networkModel) { [weak self] result in
            guard let self else { return }

            switch result {
            case .success(let response):
                self.view?.displayFeed(response.results)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension PokedexPresenter: PokedexPresenterProtocol {
    func onViewDidLoad() {
        view?.display(model: model)
    }

    func onViewWillAppear() {
        fetchPokemonList()
    }

    func handleBackTap() {
        delegate?.userNeedsToInit()
    }

    func handleMenuTap() {
        view?.displayMenuAlert(model: model.alert)
    }

    func handlePokemonTap() {
        delegate?.userNeedsToDetail(pokemonId: 1)
    }
}
