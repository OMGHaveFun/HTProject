//
//  PokedexButton.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import UIKit

final class PokedexButton: RoundButton {
    private enum Constants {
        static let contentSizeWidthOffset: CGFloat = 40.0 // x2
        static let contentSizeHeightOffset: CGFloat = 16.0 // x2

        static let borderWidth = 1.0
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override var intrinsicContentSize: CGSize {
        let titleSize = titleLabel?.sizeThatFits(CGSize(width: Int.max, height: Int.max)) ?? CGSize.zero

        return CGSize(width: Constants.contentSizeWidthOffset + titleSize.width,
                      height: Constants.contentSizeHeightOffset + titleSize.height)
    }

    public var callbackAction: (() -> Void)?

    private func setup() {
        layer.borderWidth = Constants.borderWidth
        layer.borderColor = Colors.elementsPrimaryBlack.cgColor

        backgroundColor = .clear

        let title = TextHelper.initButtonTitle(text: InitStrings.buttonTitle.string())
        setAttributedTitle(title, for: .normal)

        addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    @objc private func didTapButton() {
        callbackAction?()
    }
}
