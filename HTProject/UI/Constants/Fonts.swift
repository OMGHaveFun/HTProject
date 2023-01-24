//
//  Fonts.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 24/01/2023.
//

import UIKit

struct Fonts {}

extension Fonts {
    enum ProText {
        case regular(size: CGFloat)
        case medium(size: CGFloat)
        case bold(size: CGFloat)

        func font() -> UIFont {
            switch self {
            case .regular(let size):
                return UIFont(name: "SF-Pro-Text-Regular", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
            case .medium(let size):
                return UIFont(name: "SF-Pro-Text-Medium", size: size) ?? UIFont.systemFont(ofSize: size, weight: .medium)
            case .bold(let size):
                return UIFont(name: "SF-Pro-Text-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
            }
        }
    }
}
