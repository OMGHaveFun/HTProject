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
    private var model: PokedexDetailModel.DisplayModel
    private let networkManager: PokedexManagerProtocol

    init(view: PokedexDetailViewProtocol?, model: PokedexDetailModel.DisplayModel, networkManager: PokedexManagerProtocol) {
        self.view = view
        self.model = model
        self.networkManager = networkManager
    }
}

private extension PokedexDetailPresenter {
    func fetchPokemonSpecies() {
        networkManager.fetchPokemonSpecies(pokemonId: model.id) { result in
            switch result {
            case .success(let response):
                print("Response: ", response)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension PokedexDetailPresenter: PokedexDetailPresenterProtocol {
    func onViewDidLoad() {
        view?.display(state: .display(model))
    }

    func onViewWillAppear() {
        fetchPokemonSpecies()
    }

    func handleBackTap() {
        delegate?.userNeedsBack()
    }

    func handleLikeTap() {
        let model = PokedexDetailModel.AlertModel(title: PokedexDetailStrings.Alert.title.string(),
                                            message: PokedexDetailStrings.Alert.message.string(),
                                            buttonTitle: PokedexDetailStrings.Alert.buttonTitle.string())
        view?.display(state: .alert(model))
    }
}
