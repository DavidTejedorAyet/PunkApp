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
    @Published var searchingText: String = ""
    
    let timerManager = TimerManager()
    let apiSession: APIService
    var cancellables = Set<AnyCancellable>()
    let router: RouteToBeerDetail
    var page = 1
    
    
    init(apiSession: APIService = APISession(), router: RouteToBeerDetail = Router()) {
        self.apiSession = apiSession
        self.router = router
    }
    
    func getBeerList() {
        getBeerList(page: 1, searchingBy: "")
    }
    
    func searchBeer(text: String) {
        timerManager.waitForTimer(seconds: 1) {
            self.beerList.removeAll()
            self.page = 1
            self.getBeerList(page: 1, searchingBy: text)
        }
    }
    
    func getMoreBeers() {
        self.page += 1
        getBeerList(page: self.page, searchingBy: searchingText)
    }
    
    private func getBeerList(page: Int, searchingBy food: String) {
        print("******* ", page, food)
        let cancellable = self.getBeerList(searchingBy: searchingText, page: page)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                case .finished:
                    break
                }
                
            }) { (beerList) in
                self.beerList.append(contentsOf: beerList)
                
        }
        cancellables.insert(cancellable)
    }
}


