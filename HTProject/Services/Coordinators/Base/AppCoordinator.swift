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
    // MARK: Properties
    var childCoordinators: [CoordinatorProtocol] = []
    let navigationController: UINavigationController

    // MARK: Public methods

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showInitFlow()
    }

    private func showInitFlow() {
        let model = InitModel()
        let controller = InitAssembly.build(delegate: self, model: model)
        navigationController.pushViewController(controller, animated: true)
    }

    func showPokedexFlow() {
        let pokedexFlowCoordinator = PokedexFlowCoordinator(navigationController: navigationController)
        pokedexFlowCoordinator.delegate = self
        addChildCoordinator(pokedexFlowCoordinator)
        pokedexFlowCoordinator.start()
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
