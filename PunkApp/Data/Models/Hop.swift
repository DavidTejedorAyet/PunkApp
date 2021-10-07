//
//  Hop.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation

struct Hop: Codable {
    let name: String
    let amount: BoilVolume
    let add: AddTime
    let attribute: Attribute

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case amount = "amount"
        case add = "add"
        case attribute = "attribute"
    }
}

enum AddTime: String, Codable {
    case dryHop = "dry hop"
    case end = "end"
    case middle = "middle"
    case start = "start"
}

enum Attribute: String, Codable {
    case aroma = "aroma"
    case attributeFlavour = "Flavour"
    case bitter = "bitter"
    case flavour = "flavour"
}
