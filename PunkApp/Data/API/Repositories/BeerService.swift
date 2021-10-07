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
    
    func getBeerList() -> AnyPublisher<[Beer], APIError>
    func getRandomBeer() -> AnyPublisher<Beer, APIError>
}

extension BeerService {
    
    func getBeerList() -> AnyPublisher<[Beer], APIError> {
        return apiSession.request(with: BeerEndpoint.beerList)
            .eraseToAnyPublisher()
    }
    
    func getRandomBeer() -> AnyPublisher<Beer, APIError> {
        return apiSession.request(with: BeerEndpoint.randomBeer)
            .eraseToAnyPublisher()
    }
}
