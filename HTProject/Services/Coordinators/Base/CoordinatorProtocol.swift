//
//  CoordinatorProtocol.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var navigationController: UINavigationController { get }

    func start()

    func addChildCoordinator(_ coordinator: CoordinatorProtocol)
    func removeChildCoordinator(_ coordinator: CoordinatorProtocol)
    func popViewController(animated: Bool)
    func dismissViewController(animated: Bool, completion: (() -> Void)?)
}

// Default implementation
extension CoordinatorProtocol {
    func addChildCoordinator(_ coordinator: CoordinatorProtocol) {
        for element in childCoordinators where element === coordinator {
            return
        }

        childCoordinators.append(coordinator)
    }

    func removeChildCoordinator(_ coordinator: CoordinatorProtocol) {
        guard !childCoordinators.isEmpty else { return }

        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }

    func popViewController(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }

    func dismissViewController(animated: Bool, completion: (() -> Void)?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
}
