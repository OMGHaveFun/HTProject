//
//  AppCoordinator.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

import UIKit

protocol AppCoordinatorProtocol: CoordinatorProtocol {
    func showPokedexFlow()
}

final class AppCoordinator: AppCoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] = []
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showInitFlow()
    }

    func showPokedexFlow() {
        let pokedexFlowCoordinator = PokedexFlowCoordinator(navigationController: navigationController)
        pokedexFlowCoordinator.delegate = self
        addChildCoordinator(pokedexFlowCoordinator)
        pokedexFlowCoordinator.start()
    }
}

private extension AppCoordinator {
    func showInitFlow() {
        let model = InitModel()
        let controller = InitAssembly.make(delegate: self, model: model)
        navigationController.pushViewController(controller, animated: true)
    }
}

extension AppCoordinator: InitPresenterDelegate {
    func userNeedsToPokedex() {
        showPokedexFlow()
    }
}

extension AppCoordinator: PokedexFlowCoordinatorDelegate {
    func userPerformedInit(coordinator: CoordinatorProtocol) {
        removeChildCoordinator(coordinator)
        showInitFlow()
    }
}
