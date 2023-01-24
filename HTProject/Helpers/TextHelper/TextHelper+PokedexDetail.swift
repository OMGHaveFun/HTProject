//
//  TextHelper+PokedexDetail.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 24/01/2023.
//

import UIKit

extension TextHelper {
    static func pokedexDetailTitle(text: String) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left

        let attributes: [NSAttributedString.Key : Any] = [.paragraphStyle: paragraphStyle,
                                                          .foregroundColor: Colors.textSecondary,
                                                          .font: Fonts.ProText.bold(size: 36.0).font()]

        return NSMutableAttributedString(string: text, attributes: attributes)
    }

    static func pokedexDetailNumber(text: String) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .right

        let attributes: [NSAttributedString.Key : Any] = [.paragraphStyle: paragraphStyle,
                                                          .foregroundColor: Colors.textSecondary,
                                                          .font: Fonts.ProText.bold(size: 24.0).font()]

        return NSMutableAttributedString(string: text, attributes: attributes)
    }
}
