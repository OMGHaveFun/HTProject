//
//  InitPresenter.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import Foundation

protocol InitPresenterDelegate: AnyObject {
    func userNeedsToPokedex()
}

final class InitPresenter {
    weak var delegate: InitPresenterDelegate?
    weak var view: InitViewProtocol?

    private var model: InitModel

    init(view: InitViewProtocol?, model: InitModel) {
        self.view = view
        self.model = model
    }
}

// MARK: InitPresentation Protocol
extension InitPresenter: InitPresenterProtocol {
    func onViewDidLoad() {
        view?.display(model: model)
    }

    func handlePokerdexTap() {
        delegate?.userNeedsToPokedex()
    }
}
