//
//  ElavorationMethod.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation

struct ElavorationMethod: Codable {
    let mashTemp: [MashTemp]
    let fermentation: Fermentation
    let twist: String?

    enum CodingKeys: String, CodingKey {
        case mashTemp = "mash_temp"
        case fermentation = "fermentation"
        case twist = "twist"
    }
}
