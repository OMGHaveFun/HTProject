//
//  PokedexDetailPresenter.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import Foundation

protocol PokedexDetailPresenterDelegate: AnyObject {
    func userNeedsBack()
}

final class PokedexDetailPresenter {
    weak var delegate: PokedexDetailPresenterDelegate?
    weak var view: PokedexDetailViewProtocol?

    private var model: PokedexDetailModel

    init(view: PokedexDetailViewProtocol?, model: PokedexDetailModel) {
        self.view = view
        self.model = model
    }
}

extension PokedexDetailPresenter: PokedexDetailPresenterProtocol {
    func onViewDidLoad() {
    }

    func handleBackTap() {
        delegate?.userNeedsBack()
    }
}
