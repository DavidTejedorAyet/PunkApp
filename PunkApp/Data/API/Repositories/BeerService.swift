//
//  BeerService.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation
import Combine

protocol BeerService {
    var apiSession: APIService {get}
    
    func getBeerList(searchingBy food: String, page: Int) -> AnyPublisher<[Beer], APIError>
    func getRandomBeer() -> AnyPublisher<[Beer], APIError>
}

extension BeerService {
    
    func getBeerList(searchingBy food: String, page: Int = 1) -> AnyPublisher<[Beer], APIError> {
        return apiSession.request(with: BeerEndpoint.beerList(food, page))
            .eraseToAnyPublisher()
    }
    
    func getRandomBeer() -> AnyPublisher<[Beer], APIError> {
        return apiSession.request(with: BeerEndpoint.randomBeer)
            .eraseToAnyPublisher()
    }


}
