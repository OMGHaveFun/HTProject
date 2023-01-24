//
//  TextHelper+Init.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 24/01/2023.
//

import UIKit

extension TextHelper {
    static func initButtonTitle(text: String) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center

        let attributes: [NSAttributedString.Key : Any] = [.paragraphStyle: paragraphStyle,
                                                          .foregroundColor: Colors.textPrimary,
                                                          .font: Fonts.ProText.medium(size: 18.0).font()]

        return NSMutableAttributedString(string: text, attributes: attributes)
    }
}
