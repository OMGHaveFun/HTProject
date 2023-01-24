//
//  PokedexAssembly.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

import UIKit

final class PokedexAssembly {
    static func build(delegate: PokedexPresenterDelegate?,
                      networkManager: PokedexManagerProtocol) -> UIViewController {
        let controller = PokedexViewController()

        let presenter = PokedexPresenter(view: controller, networkManager: networkManager)
        presenter.delegate = delegate
        controller.setPresenter(presenter)

        return controller
    }
}
