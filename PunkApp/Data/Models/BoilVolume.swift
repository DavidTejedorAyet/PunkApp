//
//  BoilVolume.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation

struct BoilVolume: Codable {
    let value: Double
    let unit: Unit

    enum CodingKeys: String, CodingKey {
        case value = "value"
        case unit = "unit"
    }
}

enum Unit: String, Codable {
    case celsius = "celsius"
    case grams = "grams"
    case kilograms = "kilograms"
    case litres = "litres"
}

enum ContributedBy: String, Codable {
    case aliSkinnerAliSkinner = "Ali Skinner <AliSkinner>"
    case samMasonSamjbmason = "Sam Mason <samjbmason>"
}
