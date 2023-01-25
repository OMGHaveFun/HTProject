//
//  String+PokedexDetail.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 24/01/2023.
//

import Foundation

enum PokedexDetailStrings {
    enum Alert {
        case title
        case message
        case buttonTitle

        func string() -> String {
            switch self {
            case .title:
                return NSLocalizedString("Pokedex.Detail.Like.Alert.Title", comment: "")
            case .message:
                return NSLocalizedString("Pokedex.Detail.Like.Alert.Message", comment: "")
            case .buttonTitle:
                return NSLocalizedString("Pokedex.Detail.Like.Alert.Button.Title", comment: "")
            }
        }
    }

    enum Error {
        case title
        case buttonTitle

        func string() -> String {
            switch self {
            case .title:
                return NSLocalizedString("Pokedex.Detail.Error.Title", comment: "")
            case .buttonTitle:
                return NSLocalizedString("Pokedex.Detail.Error.Button.Title", comment: "")
            }
        }
    }
}
