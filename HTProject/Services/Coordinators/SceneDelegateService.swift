//
//  SceneDelegateService.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

import UIKit

final class SceneDelegateService {

    // MARK: Public properties

    var coordinator: AppCoordinator?
    let window: UIWindow

    // MARK: Init

    init(window: UIWindow) {
        self.window = window
    }

    // MARK: Public methods

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
