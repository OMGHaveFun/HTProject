//
//  MainCell+Model.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 16/01/2023.
//

extension MainCell {
    struct Model {
        let item: MainResponse
        var callbackAction: ((Model) -> Void)?
    }
}
