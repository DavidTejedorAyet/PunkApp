//
//  BeerDetailViewModel.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation
import Combine

class BeerDetailViewModel: ObservableObject, BeerService {
    
    @Published private(set) var beer: Beer?
    @Published var showLoader: Bool = false
    
    let apiSession: APIService
    var cancellables = Set<AnyCancellable>()
    
    var isRandomBeer = false
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    func setUpViewModel(with beer: Beer) {
        self.beer = beer
    }
    
    func getRandomBeer() {
        showLoader = true
        let cancellable = self.getRandomBeer()
            .sink(receiveCompletion: { result in
                self.showLoader = false
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
