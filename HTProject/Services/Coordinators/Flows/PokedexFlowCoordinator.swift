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

    func startDetail() {
        showPokedexDetailScene()
    }
}

private extension PokedexFlowCoordinator {
    func showPokedexScene() {
        let model = PokedexModel()
        let controller = PokedexAssembly.build(delegate: self, model: model)
        navigationController.setViewControllers([controller], animated: true)
    }

    func showPokedexDetailScene() {
        let model = PokedexDetailModel()
        let controller = PokedexDetailAssembly.build(delegate: self, model: model)
        navigationController.pushViewController(controller, animated: true)
    }
}

extension PokedexFlowCoordinator: PokedexPresenterDelegate {
    func userNeedsToInit() {
        delegate?.userPerformedInit(coordinator: self)
    }

    func userNeedsToDetail() {
        startDetail()
    }
}

extension PokedexFlowCoordinator: PokedexDetailPresenterDelegate {
    func userNeedsBack() {
        popViewController(animated: true)
    }
}
