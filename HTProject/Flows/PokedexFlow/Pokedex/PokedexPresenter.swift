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
    private let networkManager: PokedexManagerProtocol

    init(view: PokedexViewProtocol?, networkManager: PokedexManagerProtocol) {
        self.view = view
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
                self.fetchPokemons(items: response.results)
            case .failure(let error):
                self.checkError(error: error)
            }
        }
    }

    func fetchPokemons(items: [PokemonListItemResponse]) {
        var responses: [PokemonResponse] = []
        let group = DispatchGroup()

        items.forEach { item in
            group.enter()

            networkManager.fetchPokemonByLink(item.url) { [weak self] result in
                switch result {
                case .success(let response):
                    responses.append(response)
                    group.leave()
                case .failure(let error):
                    self?.checkError(error: error)
                }
            }
        }

        group.notify(queue: .main, execute: { [weak self] in
            var items: [PokedexModel.PokemonItem] = []
            responses.forEach { item in
                let tags: [String] = item.types.compactMap({ $0.type?.name })
                let type = PokedexModel.PokemonType.withLabel(tags[0]) ?? .unknown
                let pokemonItem = PokedexModel.PokemonItem(id: item.id,
                                                           number: item.id.indexString(),
                                                           name: item.name,
                                                           tags: tags,
                                                           image: item.sprites.frontDefault ?? "",
                                                           type: type)

                items.append(pokemonItem)
            }

            items = items.sorted { $0.id < $1.id }

            let model = PokedexModel.FetchDataModel(item: PokedexModel.PokedexItem(items: items))
            self?.view?.display(state: .data(model))
        })
    }

    func checkError(error: Error) {
        let model = PokedexModel.ErrorModel(title: PokedexStrings.Error.title.string(),
                                            message: error.localizedDescription,
                                            buttonTitle: PokedexStrings.Error.buttonTitle.string())
        view?.display(state: .error(model))
    }
}

extension PokedexPresenter: PokedexPresenterProtocol {
    func onViewDidLoad() {
        let model = PokedexModel.DisplayModel(title: PokedexStrings.title.string())
        view?.display(state: .display(model))
    }

    func onViewWillAppear() {
        fetchPokemonList()
    }

    func handleBackTap() {
        delegate?.userNeedsToInit()
    }

    func handleMenuTap() {
        let model = PokedexModel.AlertModel(title: PokedexStrings.Alert.title.string(),
                                            message: PokedexStrings.Alert.message.string(),
                                            buttonTitle: PokedexStrings.Alert.buttonTitle.string())
        view?.display(state: .alert(model))
    }

    func handlePokemonTap() {
        delegate?.userNeedsToDetail(pokemonId: 1)
    }
}
