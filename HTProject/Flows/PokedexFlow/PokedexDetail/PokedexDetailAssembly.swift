//
//  PokedexDetailAssembly.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import UIKit

final class PokedexDetailAssembly {
    static func build(delegate: PokedexDetailPresenterDelegate?, model: PokedexDetailModel) -> UIViewController {
        let controller = PokedexDetailViewController()

        let presenter = PokedexDetailPresenter(view: controller, model: model)
        presenter.delegate = delegate
        controller.setPresenter(presenter)

        return controller
    }
}
