//
//  PokedexDetailViewController.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import UIKit

final class PokedexDetailViewController: BaseViewController {
    private enum Constants {
        static let offsets: CGFloat = 20.0
    }

    private let backButton = NavigationButton()

    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    var presenter: PokedexDetailPresenterProtocol?

    // MARK: - Lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        setupCallbackAction()
        presenter?.onViewDidLoad()
    }

    func setPresenter(_ presenter: PokedexDetailPresenterProtocol) {
        self.presenter = presenter
    }
}

private extension PokedexDetailViewController {
    func configureUI() {
        showNavigationBar()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: backButton)

//        view.backgroundColor = .blue

        view.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges(excluding: .top)
        contentView.topAnchor ~= view.safeAreaLayoutGuide.topAnchor

        contentView.addSubview(titleLabel.prepareForAutoLayout())
        titleLabel.topAnchor ~= contentView.topAnchor + Constants.offsets
        titleLabel.leftAnchor ~= contentView.leftAnchor + Constants.offsets
        titleLabel.rightAnchor ~= contentView.rightAnchor - Constants.offsets

        titleLabel.text = "PokedexDetail"
    }

    func setupCallbackAction() {
        backButton.callbackAction = { [weak self] in
            self?.presenter?.handleBackTap()
        }
    }
}

extension PokedexDetailViewController: PokedexDetailViewProtocol {
}
