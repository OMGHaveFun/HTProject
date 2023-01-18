//
//  BaseViewController.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: Public methods
    func hideNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func showNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    // MARK: Private methods
    private func configureUI() {
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.isTranslucent = true

        view.backgroundColor = Colors.backgroundBasic

        let backImage = UIImage(systemName: "arrow.backward")
        navigationController?.navigationBar.backIndicatorImage = backImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        navigationItem.backButtonTitle = " "
    }
}
