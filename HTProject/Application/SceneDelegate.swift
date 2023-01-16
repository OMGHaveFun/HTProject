//
//  SceneDelegate.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var sceneDelegateService: SceneDelegateService?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene

        if let window = window {
            sceneDelegateService = SceneDelegateService(window: window)
            sceneDelegateService?.setupCoordinator()
        }
    }
}

