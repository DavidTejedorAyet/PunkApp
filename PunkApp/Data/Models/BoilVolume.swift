//
//  BoilVolume.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation

struct BoilVolume: Codable {
    let value: Double?
    let unit: String?

    enum CodingKeys: String, CodingKey {
        case value = "value"
        case unit = "unit"
    }
}

