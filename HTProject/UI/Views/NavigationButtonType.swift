//
//  NavigationButtonType.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import UIKit

enum NavigationButtonType {
    case back
    case backLight
    case menu
    case like

    var backgroundColor: UIColor {
        switch self {
        default:
            return .clear
        }
    }

    var disabledBackgroundColor: UIColor {
        switch self {
        default:
            return .clear
        }
    }

    var tintColor: UIColor? {
        switch self {
        case .back, .menu:
            return .black
        case .backLight, .like:
            return .white
        }
    }

    var normalImage: UIImage? {
        switch self {
        case .back, .backLight:
            return UIImage(systemName: "arrow.left",
                           withConfiguration: UIImage.SymbolConfiguration(pointSize: 20.0, weight: .medium))
        case .menu:
            return UIImage(systemName: "line.3.horizontal",
                           withConfiguration: UIImage.SymbolConfiguration(pointSize: 20.0, weight: .medium))
        case .like:
            return UIImage(systemName: "heart",
                           withConfiguration: UIImage.SymbolConfiguration(pointSize: 20.0, weight: .medium))
        }
    }

    var selectedImage: UIImage? {
        switch self {
        case .back, .backLight:
            return UIImage(systemName: "arrow.left",
                           withConfiguration: UIImage.SymbolConfiguration(pointSize: 20.0, weight: .medium))
        case .menu:
            return UIImage(systemName: "line.3.horizontal",
                           withConfiguration: UIImage.SymbolConfiguration(pointSize: 20.0, weight: .medium))
        case .like:
            return UIImage(systemName: "heart",
                           withConfiguration: UIImage.SymbolConfiguration(pointSize: 20.0, weight: .medium))
        }
    }
}
