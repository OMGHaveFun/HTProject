//
//  PokedexViewController.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

import UIKit

final class PokedexViewController: BaseViewController {
    private enum Constants {
        static let offsets: CGFloat = 20.0
        static let cellHeight: CGFloat = 120.0

        static let menuImageBackgroundSize: CGFloat = 200.0
        static let menuImageBackgroundTopOffset: CGFloat = 30.0
        static let menuImageBackgroundRightOffset: CGFloat = 72.0
    }

    private let backButton = NavigationButton()

    private let menuButton: NavigationButton = {
        let button = NavigationButton()
        button.style = .menu
        return button
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    private let imageViewBackground: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        view.contentMode = .scaleAspectFill
        view.tintColor = .black.withAlphaComponent(0.05)
        view.clipsToBounds = true
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero,
                                              collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    private var data: [PokedexModel.PokemonItem] = []

    private var presenter: PokedexPresenterProtocol?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        setupCallbackAction()
        presenter?.onViewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        presenter?.onViewWillAppear()
    }

    func setPresenter(_ presenter: PokedexPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - Private - Configure
private extension PokedexViewController {
    func configureUI() {
        showNavigationBar()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: menuButton)

        view.addSubview(imageViewBackground.prepareForAutoLayout())
        imageViewBackground.heightAnchor ~= Constants.menuImageBackgroundSize
        imageViewBackground.widthAnchor ~= Constants.menuImageBackgroundSize
        imageViewBackground.topAnchor ~= view.topAnchor - Constants.menuImageBackgroundTopOffset
        imageViewBackground.rightAnchor ~= view.rightAnchor + Constants.menuImageBackgroundRightOffset

        view.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges(excluding: .top)
        contentView.topAnchor ~= view.safeAreaLayoutGuide.topAnchor

        contentView.addSubview(titleLabel.prepareForAutoLayout())
        titleLabel.topAnchor ~= contentView.topAnchor + Constants.offsets
        titleLabel.leftAnchor ~= contentView.leftAnchor + Constants.offsets
        titleLabel.rightAnchor ~= contentView.rightAnchor - Constants.offsets

        contentView.addSubview(collectionView.prepareForAutoLayout())
        collectionView.topAnchor ~= titleLabel.bottomAnchor + Constants.offsets
        collectionView.leftAnchor ~= contentView.leftAnchor + Constants.offsets
        collectionView.rightAnchor ~= contentView.rightAnchor - Constants.offsets
        collectionView.bottomAnchor ~= contentView.bottomAnchor

        configureCollectionView()
    }

    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PokedexCell.self, forCellWithReuseIdentifier: PokedexCell.reuseIdentifier)
    }

    func setupCallbackAction() {
        backButton.callbackAction = { [weak self] in
            self?.presenter?.handleBackTap()
        }

        menuButton.callbackAction = { [weak self] in
            self?.presenter?.handleMenuTap()
        }
    }
}

// MARK: - Private - Display
private extension PokedexViewController {
    func display(_ model: PokedexModel.DisplayModel) {
        titleLabel.attributedText = TextHelper.pokedexTitle(text: model.title)
    }

    // TODO: display shimmers
    func displayShimmers(_ model: PokedexModel.ShimmersModel) {
        if model.isOn {} else {}
    }

    func displayData(_ model: PokedexModel.FetchDataModel) {
        data = model.item.items
        collectionView.reloadData()
    }

    func displayMenuAlert(_ model: PokedexModel.AlertModel) {
        let alert = UIAlertController(title: model.title, message: model.message, preferredStyle: .alert)
        let action = UIAlertAction(title: model.buttonTitle, style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }

    func displayError(_ model: PokedexModel.ErrorModel) {
        let alert = UIAlertController(title: model.title, message: model.message, preferredStyle: .alert)
        let action = UIAlertAction(title: model.buttonTitle, style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}

extension PokedexViewController: PokedexViewProtocol {
    func display(state: PokedexModel.State) {
        switch state {
        case .display(let model):
            display(model)
        case .shimmers(let model):
            displayShimmers(model)
        case .data(let model):
            displayData(model)
        case .alert(let model):
            displayMenuAlert(model)
        case .error(let model):
            displayError(model)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension PokedexViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokedexCell.reuseIdentifier, for: indexPath)

        let item = data[indexPath.row]
        if let pokedexCell = cell as? PokedexCell {
            let model = PokedexCell.Model(item: item)
            pokedexCell.setModel(model)
        }

        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension PokedexViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemon = data[indexPath.row]
        presenter?.handlePokemonTap(pokemon)
    }
}

extension PokedexViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as? UICollectionViewFlowLayout
        let minimumSpacing = layout?.minimumInteritemSpacing ?? Constants.offsets
        let widthPerItem = collectionView.frame.width / 2 - minimumSpacing

        return CGSize(width:widthPerItem, height: Constants.cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.offsets
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.offsets
    }
}
