//
//  BeerRepository.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation

enum BeerEndpoint {
    case beerList
    case beerDetal
    case randomBeer
    case searchBeer
}

extension BeerEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
            switch self {
            case .beerList:
                guard let url = URL(string: "\(Constants.baseUrl)/beers")
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
            case .searchBeer:
                guard let url = URL(string: "\(Constants.baseUrl)/beers/beer_name")
                    else {preconditionFailure("Invalid URL format")}
                let request = URLRequest(url: url)
                return request
            }
            
        }
}
