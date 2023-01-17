//
//  MainCell.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

import UIKit
import SDWebImage

final class MainCell: UICollectionViewCell {
    private let backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16.0
        view.backgroundColor = .green
        return view
    }()

    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
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

        backgroundColor = .clear

        contentView.addSubview(backView.prepareForAutoLayout())
        backView.pinEdgesToSuperviewEdges()

        backView.addSubview(imageView.prepareForAutoLayout())
        imageView.pinExcludingEdgesToSuperviewEdges(top: 20.0, left: 20.0, bottom: nil, right: 20.0)
        imageView.heightAnchor ~= imageView.widthAnchor

        let urlString = String(format: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/%d.png", 10)
        imageView.sd_setImage(with: URL(string: urlString), placeholderImage: nil)

        backView.addSubview(titleLabel.prepareForAutoLayout())
        titleLabel.leftAnchor ~= backView.leftAnchor + 20.0
        titleLabel.rightAnchor ~= backView.rightAnchor - 64.0
        titleLabel.topAnchor ~= imageView.bottomAnchor + 18.0
        titleLabel.text = "Pokemon"

        backView.addSubview(numberLabel.prepareForAutoLayout())
        numberLabel.leftAnchor ~= backView.leftAnchor + 20.0
        numberLabel.rightAnchor ~= backView.rightAnchor - 20.0
        numberLabel.topAnchor ~= titleLabel.bottomAnchor + 6.0
        numberLabel.bottomAnchor <= backView.bottomAnchor - 15.0
        numberLabel.text = "001"
    }
}
