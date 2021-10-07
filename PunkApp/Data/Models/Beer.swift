//
//  BeerListAPIResponse.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation


struct Beer: Codable, Identifiable {
    let id: Int?
    let name: String?
    let tagline: String?
    let firstBrewed: String?
    let description: String?
    let imageURL: String?
    let abv: Double?
    let ibu: Double?
    let targetFg: Int?
    let targetOg: Double?
    let ebc: Int?
    let srm: Double?
    let ph: Double?
    let attenuationLevel: Double?
    let volume: BoilVolume?
    let boilVolume: BoilVolume?
    let method: ElavorationMethod?
    let ingredients: Ingredients?
    let foodPairing: [String]?
    let brewersTips: String?
    let contributedBy: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case tagline = "tagline"
        case firstBrewed = "first_brewed"
        case description = "description"
        case imageURL = "image_url"
        case abv = "abv"
        case ibu = "ibu"
        case targetFg = "target_fg"
        case targetOg = "target_og"
        case ebc = "ebc"
        case srm = "srm"
        case ph = "ph"
        case attenuationLevel = "attenuation_level"
        case volume = "volume"
        case boilVolume = "boil_volume"
        case method = "method"
        case ingredients = "ingredients"
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
    }
}
