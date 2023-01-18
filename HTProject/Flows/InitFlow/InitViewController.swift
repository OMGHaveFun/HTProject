//
//  InitViewController.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import UIKit

final class InitViewController: BaseViewController {
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LaunchScreen.Logo")
        imageView.tintColor = UIColor(named: "LaunchScreen.Logo.Tint")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let pokedexButton = PokedexButton()

    var presenter: InitPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        setupCallbackAction()
        presenter?.onViewDidLoad()
    }

    func setPresenter(_ presenter: InitPresenterProtocol) {
        self.presenter = presenter
    }
}

private extension InitViewController {
    func configureUI() {
        hideNavigationBar()

        view.addSubview(logoImageView.prepareForAutoLayout())
        logoImageView.centerXAnchor ~= view.centerXAnchor
        logoImageView.centerYAnchor ~= view.centerYAnchor
        logoImageView.heightAnchor ~= 240.0
        logoImageView.widthAnchor ~= 240.0

        view.addSubview(pokedexButton.prepareForAutoLayout())
        pokedexButton.centerXAnchor ~= view.centerXAnchor
        pokedexButton.bottomAnchor ~= view.safeAreaLayoutGuide.bottomAnchor - 20.0
    }

    func setupCallbackAction() {
        pokedexButton.callbackAction = { [weak self] in
            self?.presenter?.handlePokerdexTap()
        }
    }
}

// MARK: InitView Protocol
extension InitViewController: InitViewProtocol {
    func display(model: InitModel) {
    }
}
