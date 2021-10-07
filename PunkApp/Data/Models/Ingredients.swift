//
//  Ingredients.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation

struct Ingredients: Codable {
    let malt: [Malt]
    let hops: [Hop]
    let yeast: String

    enum CodingKeys: String, CodingKey {
        case malt = "malt"
        case hops = "hops"
        case yeast = "yeast"
    }
}
