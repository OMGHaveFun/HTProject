//
//  Colors.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import UIKit

struct Colors {
    static let backgroundBasic = Background.basic.color()

    public static let elementsPrimaryBlack = Elements.primaryBlack.color()
}

private extension Colors {
    enum Background {
        case basic

        func color() -> UIColor {
            switch self {
            case .basic:
                return UIColor(named: "Background.Basic") ?? .systemBackground
            }
        }
    }
}

private extension Colors {
    enum Elements {
        case primaryBlack

        func color() -> UIColor {
            switch self {
            case .primaryBlack:
                return UIColor(named: "Elements.Primary.Black") ?? .black
            }
        }
    }
}
