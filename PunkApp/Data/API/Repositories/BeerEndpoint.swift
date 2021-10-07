//
//  BeerRepository.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation

enum BeerEndpoint {
    case beerList(Int)
    case beerDetal
    case randomBeer
    case searchBeer(String, Int)
}

extension BeerEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
            switch self {
            case .beerList(let page):
                guard let url = URL(string: "\(Constants.baseUrl)/beers?page=\(page)")
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
            case .searchBeer(let food, let page):
                guard let url = URL(string: "\(Constants.baseUrl)/beers?food=\(food)&page=\(page)")
                    else {preconditionFailure("Invalid URL format")}
                let request = URLRequest(url: url)
                return request
            }
            
        }
}
