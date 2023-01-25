//
//  InitAssembly.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import UIKit

final class InitAssembly {
    static func make(delegate: InitPresenterDelegate?, model: InitModel) -> UIViewController {
        let controller = InitViewController()

        let presenter = InitPresenter(view: controller, model: model)
        presenter.delegate = delegate
        controller.setPresenter(presenter)

        return controller
    }
}
