//
//  NavigationButtonType.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import UIKit

enum NavigationButtonType {
    case back
    case menu

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
        case .back:
            return .blue
        default:
            return .clear
        }
    }

    var normalImage: UIImage? {
        switch self {
        case .back:
            return UIImage(systemName: "arrow.backward")
        case .menu:
            return UIImage(named: "navigation_button_menu")
        }
    }

    var selectedImage: UIImage? {
        switch self {
        case .back:
            return UIImage(systemName: "arrow.backward")
        case .menu:
            return UIImage(named: "navigation_button_menu")
        }
    }
}
