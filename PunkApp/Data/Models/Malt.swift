//
//  Malt.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation

struct Malt: Codable {
    let name: String
    let amount: BoilVolume

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case amount = "amount"
    }
}
