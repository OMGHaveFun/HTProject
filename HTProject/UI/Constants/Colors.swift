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

    public static let textPrimary = Text.primary.color()
    public static let textSecondary = Text.secondary.color()
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

extension Colors {
    enum PokemonType: String {
        case bug
        case normal
        case fire
        case water
        case grass
        case electric
        case unknown

        func color() -> UIColor {
            switch self {
            case .bug:
                return UIColor(named: "PokemonType.Bug") ?? .systemGreen
            case .normal:
                return UIColor(named: "PokemonType.Normal") ?? .systemBlue
            case .fire:
                return UIColor(named: "PokemonType.Fire") ?? .systemRed
            case .water:
                return UIColor(named: "PokemonType.Water") ?? .systemBlue
            case .grass:
                return UIColor(named: "PokemonType.Grass") ?? .systemGreen
            case .electric:
                return UIColor(named: "PokemonType.Electric") ?? .systemYellow
            default:
                return UIColor(named: "PokemonType.Unknown") ?? .darkGray
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

private extension Colors {
    enum Text {
        case primary
        case secondary

        func color() -> UIColor {
            switch self {
            case .primary:
                return UIColor(named: "Text.Primary") ?? .black
            case .secondary:
                return UIColor(named: "Text.Secondary") ?? .white
            }
        }
    }
}
