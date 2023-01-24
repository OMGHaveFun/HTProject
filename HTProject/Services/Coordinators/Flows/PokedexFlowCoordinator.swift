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

    func startDetail(pokemonId: Int) {
        showPokedexDetailScene(pokemonId: pokemonId)
    }
}

private extension PokedexFlowCoordinator {
    func showPokedexScene() {
        let networkManager = PokedexManager.shared
        let controller = PokedexAssembly.build(delegate: self, networkManager: networkManager)
        navigationController.setViewControllers([controller], animated: true)
    }

    func showPokedexDetailScene(pokemonId: Int) {
        let model = PokedexDetailModel(pokemonId: pokemonId)
        let networkManager = PokedexManager.shared
        let controller = PokedexDetailAssembly.build(delegate: self, model: model, networkManager: networkManager)
        navigationController.pushViewController(controller, animated: true)
    }
}

extension PokedexFlowCoordinator: PokedexPresenterDelegate {
    func userNeedsToInit() {
        delegate?.userPerformedInit(coordinator: self)
    }

    func userNeedsToDetail(pokemonId: Int) {
        startDetail(pokemonId: pokemonId)
    }
}

extension PokedexFlowCoordinator: PokedexDetailPresenterDelegate {
    func userNeedsBack() {
        popViewController(animated: true)
    }
}
