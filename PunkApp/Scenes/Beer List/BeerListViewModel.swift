//
//  BeerListViewModel.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation
import Combine
import SwiftUI


class BeerListViewModel: ObservableObject, BeerService {
    
    @Published var beerList = [Beer]()
    
    var apiSession: APIService
    var cancellables = Set<AnyCancellable>()
    var router: RouteToBeerDetail
    
    init(apiSession: APIService = APISession(), router: RouteToBeerDetail = Router()) {
        self.apiSession = apiSession
        self.router = router
    }
    
    func getBeerList() {
        let cancellable = self.getBeerList()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                case .finished:
                    break
                }
                
            }) { (beerList) in
                self.beerList = beerList
        }
        cancellables.insert(cancellable)
    }
    
}


