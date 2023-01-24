//
//  Strings+Pokedex.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 18/01/2023.
//

import Foundation

enum PokedexStrings {
    case title

    func string() -> String {
        switch self {
        case .title:
            return NSLocalizedString("Pokedex.Title", comment: "")
        }
    }

    enum Alert {
        case title
        case message
        case buttonTitle

        func string() -> String {
            switch self {
            case .title:
                return NSLocalizedString("Pokedex.Menu.Alert.Title", comment: "")
            case .message:
                return NSLocalizedString("Pokedex.Menu.Alert.Message", comment: "")
            case .buttonTitle:
                return NSLocalizedString("Pokedex.Menu.Alert.Button.Title", comment: "")
            }
        }
    }

    enum Error {
        case title
        case buttonTitle

        func string() -> String {
            switch self {
            case .title:
                return NSLocalizedString("Pokedex.Error.Title", comment: "")
            case .buttonTitle:
                return NSLocalizedString("Pokedex.Error.Button.Title", comment: "")
            }
        }
    }
}
