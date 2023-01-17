//
//  AppCoordinator.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

import UIKit

protocol AppCoordinatorProtocol: CoordinatorProtocol {
    func showMainFlow()
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
        showMainFlow()
    }

    internal func showMainFlow() {
        let controller = MainAssembly.build(delegate: self)
        navigationController.pushViewController(controller, animated: true)
    }
}

extension AppCoordinator: MainPresenterDelegate {
    func userNeedsToDetail() {
    }
}
