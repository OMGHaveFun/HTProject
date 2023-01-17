//
//  SceneDelegateService.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

import UIKit

final class SceneDelegateService {
    var coordinator: AppCoordinator?
    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func setupCoordinator() {
        window.rootViewController = BaseNavigationController()

        guard let rootNavigationController = window.rootViewController as? UINavigationController else {
            fatalError("Root viewController must be inherited from UINavigationController")
        }

        coordinator = AppCoordinator(navigationController: rootNavigationController)
        coordinator?.start()

        window.makeKeyAndVisible()
    }
}
