//
//  Int+String.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 24/01/2023.
//

import Foundation

extension Int {
    func indexString() -> String {
        let idString = String(self)

        switch idString.count {
        case 1:
            return "00" + idString
        case 2:
            return "0" + idString
        default:
            return idString
        }
    }
}
