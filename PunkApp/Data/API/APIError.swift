//
//  APIError.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
