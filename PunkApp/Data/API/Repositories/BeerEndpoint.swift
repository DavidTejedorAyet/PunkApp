//
//  BeerRepository.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation

enum BeerEndpoint {
    case beerList(String, Int)
    case beerDetal
    case randomBeer
}

extension BeerEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
            switch self {
            case .beerList(let food, let page):
                var endpoint = "\(Constants.baseUrl)/beers?page=\(page)"
                if !food.isEmpty {
                    endpoint.append(contentsOf: "&food=\(food)")
                }
                guard let url = URL(string: endpoint)
                    else {preconditionFailure("Invalid URL format")}
                let request = URLRequest(url: url)
                return request
                
            case .beerDetal:
                guard let url = URL(string: "\(Constants.baseUrl)/beers/1")
                    else {preconditionFailure("Invalid URL format")}
                let request = URLRequest(url: url)
                return request
                
            case .randomBeer:
                guard let url = URL(string: "\(Constants.baseUrl)/beers/random")
                    else {preconditionFailure("Invalid URL format")}
                let request = URLRequest(url: url)
                return request
            }
        }
}
