//
//  MainPresenter.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

import Foundation

protocol MainPresenterDelegate: AnyObject {
    func userNeedsToDetail()
}

final class MainPresenter {
    weak var delegate: MainPresenterDelegate?
    weak var view: MainViewProtocol?

    init(view: MainViewProtocol? = nil) {
        self.view = view
    }
}

extension MainPresenter: MainPresenterProtocol {
    func onViewDidLoad() {

    }
}
