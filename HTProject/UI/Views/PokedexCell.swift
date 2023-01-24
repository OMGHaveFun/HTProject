//
//  PokedexCell.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

import UIKit
import SDWebImage

final class PokedexCell: UICollectionViewCell {
    private let backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16.0
        return view
    }()

    private let numberLabel: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 0
        return lable
    }()

    private let titleLabel: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 0
        return lable
    }()

    private let tagView: TagView = TagView()

    private let imageViewBackground: UIImageView = {
        let view = UIImageView()
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

    var model: Model? {
        didSet {
            configureUI()
        }
    }

    private func configureUI() {
        guard let model else { return }

        backgroundColor = .clear

        contentView.addSubview(backView.prepareForAutoLayout())
        backView.pinEdgesToSuperviewEdges()

        backView.addSubview(numberLabel.prepareForAutoLayout())
        numberLabel.topAnchor ~= backView.topAnchor + 6.0
        numberLabel.rightAnchor ~= backView.rightAnchor - 6.0

        backView.addSubview(titleLabel.prepareForAutoLayout())
        titleLabel.leftAnchor ~= backView.leftAnchor + 6.0
        titleLabel.topAnchor ~= backView.topAnchor + 18.0
        titleLabel.text = model.item.name.capitalized

        backView.addSubview(imageViewBackground.prepareForAutoLayout())
        imageViewBackground.pinExcludingEdgesToSuperviewEdges(top: 30.0, left: nil, bottom: 0.0, right: 0.0)
        imageViewBackground.heightAnchor ~= imageViewBackground.widthAnchor

        imageViewBackground.addSubview(imageView.prepareForAutoLayout())
        imageView.pinEdgesToSuperviewEdges()

        backView.addSubview(tagView.prepareForAutoLayout())
        tagView.topAnchor ~= titleLabel.bottomAnchor + 6.0
        tagView.leftAnchor ~= backView.leftAnchor + 6.0
        tagView.rightAnchor ~= imageView.leftAnchor - 6.0
        tagView.bottomAnchor <= backView.bottomAnchor - 18.0

        backView.backgroundColor = Colors.PokemonType(rawValue: model.item.type.rawValue)?.color()

        titleLabel.attributedText = TextHelper.pokedexCellTitle(text: model.item.name.capitalized)
        numberLabel.attributedText = TextHelper.pokedexCellNumber(text: model.item.number)

        let tagViewModel = TagView.Model(titles: model.item.tags)
        tagView.model = tagViewModel

        imageViewBackground.image = UIImage(named: "logo")
        imageView.sd_setImage(with: URL(string: model.item.image), placeholderImage: nil)
    }
}
