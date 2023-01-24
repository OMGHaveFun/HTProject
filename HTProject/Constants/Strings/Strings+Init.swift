//
//  Strings+Init.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 24/01/2023.
//

import Foundation

enum InitStrings {
    case buttonTitle

    func string() -> String {
        switch self {
        case .buttonTitle:
            return NSLocalizedString("Init.Button.Title", comment: "")
        }
    }
}
