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

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero,
                                              collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    private var data: [MainResponse] = []

    var presenter: PokedexPresenterProtocol?

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

    func setPresenter(_ presenter: PokedexPresenterProtocol) {
        self.presenter = presenter
    }
}

private extension PokedexViewController {
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

        titleLabel.text = "Pokedex"

        contentView.addSubview(collectionView.prepareForAutoLayout())
        collectionView.topAnchor ~= titleLabel.bottomAnchor + Constants.offsets
        collectionView.leftAnchor ~= contentView.leftAnchor
        collectionView.rightAnchor ~= contentView.rightAnchor
        collectionView.bottomAnchor ~= contentView.bottomAnchor

        configureCollectionView()
    }

    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: "MainCell")
    }

    func setupCallbackAction() {
        backButton.callbackAction = { [weak self] in
            self?.presenter?.handleBackTap()
        }
    }
}

extension PokedexViewController: PokedexViewProtocol {
}

extension PokedexViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20 // data.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath)

//        let product = data[indexPath.row]
//        presenter?.handleImage(productId: product.id)
        if let mainCell = cell as? MainCell {
            var mainModel = MainCell.Model(item: MainResponse())
//            productModel.likeCallbackAction = { [weak self] product in
//                self?.likePressed(productId: product.item.id, isActive: product.item.isLike)
//            }
            mainCell.model = mainModel
        }

        return cell
    }
}

extension PokedexViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.handlePokemonTap()
//        let product = data[indexPath.row]
//
//        presenter?.handleProductOpened(productId: product.id)
//
//        let controller = FeedDetailAssembly.build(model: product, entryPoint: .feed)
//        controller.modalPresentationStyle = .fullScreen
//        present(controller, animated: true)
    }
}

extension PokedexViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as? UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - (lay?.minimumInteritemSpacing ?? 20.0)

        return CGSize(width:widthPerItem, height: 150.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
}
