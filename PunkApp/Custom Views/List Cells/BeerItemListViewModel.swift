//
//  BeerItemListViewModel.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation

class BeerItemListViewModel: ObservableObject {
    
    @Published var beer: Beer
    
    init (beer: Beer) {
        self.beer = beer
    }
}
