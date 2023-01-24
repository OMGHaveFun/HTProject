//
//  TextHelper+Pokedex.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 24/01/2023.
//

import UIKit

extension TextHelper {
    static func pokedexTitle(text: String) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left

        let attributes: [NSAttributedString.Key : Any] = [.paragraphStyle: paragraphStyle,
                                                          .foregroundColor: Colors.textPrimary,
                                                          .font: Fonts.ProText.bold(size: 26.0).font()]

        return NSMutableAttributedString(string: text, attributes: attributes)
    }

    static func pokedexCellTitle(text: String) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left

        let attributes: [NSAttributedString.Key : Any] = [.paragraphStyle: paragraphStyle,
                                                          .foregroundColor: Colors.textSecondary,
                                                          .font: Fonts.ProText.bold(size: 18.0).font()]

        return NSMutableAttributedString(string: text, attributes: attributes)
    }

    static func pokedexCellNumber(text: String) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .right

        let attributes: [NSAttributedString.Key : Any] = [.paragraphStyle: paragraphStyle,
                                                          .foregroundColor: Colors.textSecondary,
                                                          .font: Fonts.ProText.bold(size: 16.0).font()]

        return NSMutableAttributedString(string: text, attributes: attributes)
    }

    static func pokedexCellTag(text: String) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center

        let attributes: [NSAttributedString.Key : Any] = [.paragraphStyle: paragraphStyle,
                                                          .foregroundColor: Colors.textSecondary,
                                                          .font: Fonts.ProText.regular(size: 12.0).font()]

        return NSMutableAttributedString(string: text, attributes: attributes)
    }
}
