//
//  PokedexDetailAssembly.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import UIKit

final class PokedexDetailAssembly {
    static func make(delegate: PokedexDetailPresenterDelegate?,
                      model: PokedexDetailModel.DisplayModel,
                      networkManager: PokedexManagerProtocol) -> UIViewController {
        let controller = PokedexDetailViewController()

        let presenter = PokedexDetailPresenter(view: controller, model: model, networkManager: networkManager)
        presenter.delegate = delegate
        controller.setPresenter(presenter)

        return controller
    }
}
