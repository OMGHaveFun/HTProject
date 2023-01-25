//
//  PokedexFlowCoordinator.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import UIKit

protocol PokedexFlowCoordinatorDelegate: AnyObject {
    func userPerformedInit(coordinator: CoordinatorProtocol)
}

final class PokedexFlowCoordinator: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] = []
    let navigationController: UINavigationController
    weak var delegate: PokedexFlowCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showPokedexScene()
    }

    func startDetail(pokemon: PokedexModel.PokemonItem) {
        showPokedexDetailScene(pokemon: pokemon)
    }
}

private extension PokedexFlowCoordinator {
    func showPokedexScene() {
        let networkManager = PokedexManager()
        let controller = PokedexAssembly.make(delegate: self, networkManager: networkManager)
        navigationController.setViewControllers([controller], animated: true)
    }

    func showPokedexDetailScene(pokemon: PokedexModel.PokemonItem) {
        let model = PokedexDetailModel.DisplayModel(id: pokemon.id,
                                                    number: pokemon.number,
                                                    name: pokemon.name,
                                                    tags: pokemon.tags,
                                                    image: pokemon.image,
                                                    type: pokemon.type)
        let networkManager = PokedexManager()
        let controller = PokedexDetailAssembly.make(delegate: self, model: model, networkManager: networkManager)
        navigationController.pushViewController(controller, animated: true)
    }
}

extension PokedexFlowCoordinator: PokedexPresenterDelegate {
    func userNeedsToInit() {
        delegate?.userPerformedInit(coordinator: self)
    }

    func userNeedsToDetail(pokemon: PokedexModel.PokemonItem) {
        startDetail(pokemon: pokemon)
    }
}

extension PokedexFlowCoordinator: PokedexDetailPresenterDelegate {
    func userNeedsBack() {
        popViewController(animated: true)
    }
}
