//
//  MashTemp.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation

struct MashTemp: Codable {
    let temp: BoilVolume?
    let duration: Int?

    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case duration = "duration"
    }
}
