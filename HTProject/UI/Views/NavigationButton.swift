//
//  NavigationButton.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import UIKit

final class NavigationButton: UIButton {
    var style: NavigationButtonType = .back {
        didSet {
            setup()
        }
    }

    override var isEnabled: Bool {
        willSet {
            if newValue == true {
                backgroundColor = style.backgroundColor
            } else {
                backgroundColor = style.disabledBackgroundColor
            }
        }
    }

    // MARK: - Callback
    public var callbackAction: (() -> Void)?

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 44.0, height: 44.0)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setup()
    }

    private func setup() {
        backgroundColor = style.backgroundColor

        tintColor = style.tintColor

        setTitle(nil, for: .normal)

        setImage(style.normalImage, for: .normal)
        setImage(style.selectedImage, for: .selected)

        addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    @objc private func didTapButton() {
        callbackAction?()
    }
}
