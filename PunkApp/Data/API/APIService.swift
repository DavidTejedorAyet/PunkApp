//
//  BeerRepository.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
}
