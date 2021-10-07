//
//  Fermentation.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation

struct Fermentation: Codable {
    let temp: BoilVolume?

    enum CodingKeys: String, CodingKey {
        case temp = "temp"
    }
}
