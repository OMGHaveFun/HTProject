//
//  TagViewItem.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 24/01/2023.
//

import UIKit

final class TagViewItem: UIView {
    private enum Constants {
        static let width: CGFloat = 80.0
        static let height: CGFloat = 24.0
        static let cornerRadius: CGFloat = 12.0
    }

    private let contentView: UIView = UIView()
    private let titleLabel: UILabel = UILabel()

    var model: Model? {
        didSet {
            setupAppearance()
        }
    }

    init() {
        super.init(frame: .zero)
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public var intrinsicContentSize: CGSize {
        return CGSize(width: Constants.width, height: Constants.height)
    }

    private func configureUI() {
        clipsToBounds = true
        layer.cornerRadius = Constants.cornerRadius

        addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges()

        contentView.addSubview(titleLabel.prepareForAutoLayout())
        titleLabel.centerXAnchor ~= contentView.centerXAnchor
        titleLabel.centerYAnchor ~= contentView.centerYAnchor
    }

    private func setupAppearance() {
        guard let model = model else { return }

        contentView.backgroundColor = .black.withAlphaComponent(0.1)
        titleLabel.attributedText = TextHelper.pokedexCellTag(text: model.title.capitalized)
    }
}
