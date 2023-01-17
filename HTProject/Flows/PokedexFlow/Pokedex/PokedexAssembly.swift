//
//  MainAssembly.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

import UIKit

final class MainAssembly {
    static func build(delegate: MainPresenterDelegate?) -> UIViewController {
        let controller = MainViewController()

        let presenter = MainPresenter(view: controller)
        presenter.delegate = delegate
        controller.setPresenter(presenter)

        return controller
    }
}
