//
//  PokedexAssembly.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

import UIKit

final class PokedexAssembly {
    static func build(delegate: PokedexPresenterDelegate?, model: PokedexModel) -> UIViewController {
        let controller = PokedexViewController()

        let presenter = PokedexPresenter(view: controller, model: model)
        presenter.delegate = delegate
        controller.setPresenter(presenter)

        return controller
    }
}
