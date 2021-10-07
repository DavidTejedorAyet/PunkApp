//
//  Hop.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation

struct Hop: Codable {
    let name: String?
    let amount: BoilVolume?
    let add: String?
    let attribute: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case amount = "amount"
        case add = "add"
        case attribute = "attribute"
    }
}

