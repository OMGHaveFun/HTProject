//
//  PokedexDetailViewController.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import UIKit
import SDWebImage

final class PokedexDetailViewController: BaseViewController {
    private enum Constants {
        static let offsets: CGFloat = 20.0
        static let imageBackgroundSize: CGFloat = 240.0
        static let imageSize: CGFloat = 200.0
        static let radius: CGFloat = 20.0
    }

    private let backButton: NavigationButton = {
        let button = NavigationButton()
        button.style = .backLight
        return button
    }()

    private let likeButton: NavigationButton = {
        let button = NavigationButton()
        button.style = .like
        return button
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    private let titleLabel: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 0
        return lable
    }()

    private let numberLabel: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 0
        return lable
    }()

    private let tagView: TagView = TagView()

    private let imageViewBackground: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        view.contentMode = .scaleAspectFill
        view.tintColor = .white.withAlphaComponent(0.3)
        view.clipsToBounds = true
        return view
    }()

    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()

    private let infoView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.backgroundBasic
        view.clipsToBounds = true
        view.layer.cornerRadius = Constants.radius
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()

    private var presenter: PokedexDetailPresenterProtocol?

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

    func setPresenter(_ presenter: PokedexDetailPresenterProtocol) {
        self.presenter = presenter
    }
}

private extension PokedexDetailViewController {
    func configureUI() {
        showNavigationBar()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: likeButton)

        view.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges(excluding: .top)
        contentView.topAnchor ~= view.safeAreaLayoutGuide.topAnchor

        contentView.addSubview(titleLabel.prepareForAutoLayout())
        titleLabel.topAnchor ~= contentView.topAnchor + Constants.offsets
        titleLabel.leftAnchor ~= contentView.leftAnchor + Constants.offsets
        titleLabel.rightAnchor ~= contentView.rightAnchor - Constants.offsets

        contentView.addSubview(numberLabel.prepareForAutoLayout())
        numberLabel.centerYAnchor ~= titleLabel.centerYAnchor
        numberLabel.rightAnchor ~= contentView.rightAnchor - Constants.offsets

        contentView.addSubview(tagView.prepareForAutoLayout())
        tagView.topAnchor ~= titleLabel.bottomAnchor + Constants.offsets / 2
        tagView.leftAnchor ~= contentView.leftAnchor + Constants.offsets
        tagView.rightAnchor ~= contentView.rightAnchor - Constants.offsets

        contentView.addSubview(imageViewBackground.prepareForAutoLayout())
        imageViewBackground.heightAnchor ~= Constants.imageBackgroundSize
        imageViewBackground.widthAnchor ~= Constants.imageBackgroundSize
        imageViewBackground.topAnchor ~= tagView.bottomAnchor + Constants.offsets
        imageViewBackground.rightAnchor ~= contentView.rightAnchor + Constants.offsets

        contentView.addSubview(imageView.prepareForAutoLayout())
        imageView.heightAnchor ~= Constants.imageSize
        imageView.widthAnchor ~= Constants.imageSize
        imageView.topAnchor ~= tagView.bottomAnchor + Constants.offsets
        imageView.centerXAnchor ~= contentView.centerXAnchor

        contentView.addSubview(infoView.prepareForAutoLayout())
        infoView.sendSubviewToBack(imageView)
        infoView.topAnchor ~= tagView.bottomAnchor + 200.0
        infoView.leftAnchor ~= contentView.leftAnchor
        infoView.rightAnchor ~= contentView.rightAnchor
        infoView.bottomAnchor ~= contentView.bottomAnchor
    }

    func setupCallbackAction() {
        backButton.callbackAction = { [weak self] in
            self?.presenter?.handleBackTap()
        }

        likeButton.callbackAction = { [weak self] in
            self?.presenter?.handleLikeTap()
        }
    }
}

// MARK: - Private - Display
private extension PokedexDetailViewController {
    func display(_ model: PokedexDetailModel.DisplayModel) {
        view.backgroundColor = Colors.PokemonType(rawValue: model.type.rawValue)?.color()

        titleLabel.attributedText = TextHelper.pokedexDetailTitle(text: model.name.capitalized)
        numberLabel.attributedText = TextHelper.pokedexDetailNumber(text: model.number)

        let tagViewModel = TagView.Model(titles: model.tags)
        tagView.model = tagViewModel

        imageView.sd_setImage(with: URL(string: model.image), placeholderImage: nil)
    }

    // TODO: display shimmers
    func displayShimmers(_ model: PokedexDetailModel.ShimmersModel) {
        if model.isOn {} else {}
    }

    func displayLikeAlert(_ model: PokedexDetailModel.AlertModel) {
        let alert = UIAlertController(title: model.title, message: model.message, preferredStyle: .alert)
        let action = UIAlertAction(title: model.buttonTitle, style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}

extension PokedexDetailViewController: PokedexDetailViewProtocol {
    func display(state: PokedexDetailModel.State) {
        switch state {
        case .display(let model):
            display(model)
        case .shimmers(let model):
            displayShimmers(model)
        case .alert(let model):
            displayLikeAlert(model)
        }
    }
}
