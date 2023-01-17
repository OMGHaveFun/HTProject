//
//  RoundButton.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import UIKit

class RoundButton: UIButton {
    private enum Constants {
        static let cornerRadius: CGFloat = 10.0
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        clipsToBounds = true
        layer.cornerRadius = Constants.cornerRadius
    }
}
