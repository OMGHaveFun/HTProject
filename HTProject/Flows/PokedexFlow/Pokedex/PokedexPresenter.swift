//
//  PokedexPresenter.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

import Foundation

protocol PokedexPresenterDelegate: AnyObject {
    func userNeedsToInit()
    func userNeedsToDetail()
}

final class PokedexPresenter {
    weak var delegate: PokedexPresenterDelegate?
    weak var view: PokedexViewProtocol?

    private var model: PokedexModel

    init(view: PokedexViewProtocol?, model: PokedexModel) {
        self.view = view
        self.model = model
    }
}

extension PokedexPresenter: PokedexPresenterProtocol {
    func onViewDidLoad() {
    }

    func handleBackTap() {
        delegate?.userNeedsToInit()
    }

    func handleMenuTap() {
    }

    func handlePokemonTap() {
        delegate?.userNeedsToDetail()
    }
}
