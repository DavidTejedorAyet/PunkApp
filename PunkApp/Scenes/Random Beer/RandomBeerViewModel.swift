//
//  RandomBeerViewModel.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation
import Combine
import SwiftUI

class RandomBeerViewModel: ObservableObject, BeerService {
    
    var apiSession: APIService
    @Published var beer: Beer?
    
    var cancellables = Set<AnyCancellable>()
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    func getRandomBeer() {
        let cancellable = self.getRandomBeer()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                case .finished:
                    break
                }
                
            }) { (beerList) in
                self.beer = beerList.first
        }
        cancellables.insert(cancellable)
    }
    
}

