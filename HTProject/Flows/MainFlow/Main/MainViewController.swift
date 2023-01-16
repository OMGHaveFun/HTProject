//
//  MainViewController.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

import UIKit

final class MainViewController: BaseViewController {
    private enum Constants {
        static let offsets: CGFloat = 20.0
    }

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

    private var data: [FeedResponse] = []


    var presenter: MainPresenterProtocol?

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
        presenter?.onViewDidLoad()
    }

    func setPresenter(_ presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
}

private extension MainViewController {
    func configureUI() {
        view.backgroundColor = .blue

        view.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges(excluding: .top)
        contentView.topAnchor ~= view.safeAreaLayoutGuide.topAnchor

        contentView.addSubview(titleLabel.prepareForAutoLayout())
        titleLabel.topAnchor ~= contentView.topAnchor + Constants.offsets
        titleLabel.leftAnchor ~= contentView.leftAnchor + Constants.offsets
        titleLabel.rightAnchor ~= contentView.rightAnchor - Constants.offsets
    }
}

extension MainViewController: MainViewProtocol {
}

extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()

//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath)
//        let product = data[indexPath.row]
//        presenter?.handleImage(productId: product.id)
//        if let productCell = cell as? ProductCell {
//            var productModel = ProductCell.Model(item: product)
//            productModel.likeCallbackAction = { [weak self] product in
//                self?.likePressed(productId: product.item.id, isActive: product.item.isLike)
//            }
//            productCell.model = productModel
//        }
//
//        return cell
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let product = data[indexPath.row]
//
//        presenter?.handleProductOpened(productId: product.id)
//
//        let controller = FeedDetailAssembly.build(model: product, entryPoint: .feed)
//        controller.modalPresentationStyle = .fullScreen
//        present(controller, animated: true)
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 184.0, height: 264.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
}
