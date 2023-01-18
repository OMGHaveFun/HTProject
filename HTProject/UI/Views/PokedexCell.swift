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
        view.backgroundColor = .green
        return view
    }()

    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
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

    var model: Model? {
        didSet {
            configureUI()
        }
    }

    private func configureUI() {
        guard let model else { return }

        let pokemonId = model.item.url
            .replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon/", with: "")
            .replacingOccurrences(of: "/", with: "")

        backgroundColor = .clear

        contentView.addSubview(backView.prepareForAutoLayout())
        backView.pinEdgesToSuperviewEdges()

        backView.addSubview(imageView.prepareForAutoLayout())
        imageView.pinExcludingEdgesToSuperviewEdges(top: 40.0, left: 100.0, bottom: 0.0, right: 0.0)
//        imageView.heightAnchor ~= imageView.widthAnchor

        let urlString = String(format: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/%@.png", pokemonId)
        imageView.sd_setImage(with: URL(string: urlString), placeholderImage: nil)

        backView.addSubview(titleLabel.prepareForAutoLayout())
        titleLabel.leftAnchor ~= backView.leftAnchor + 10.0
        titleLabel.topAnchor ~= backView.topAnchor + 40.0
        titleLabel.text = model.item.name.capitalized

        backView.addSubview(numberLabel.prepareForAutoLayout())
        numberLabel.topAnchor ~= backView.topAnchor + 10.0
        numberLabel.rightAnchor ~= backView.rightAnchor - 10.0

        // TODO: Move to helper
        var number = ""
        switch pokemonId.count {
        case 1:
            number = "00" + pokemonId
        case 2:
            number = "0" + pokemonId
        default:
            number = pokemonId
        }

        numberLabel.text = number
    }
}
