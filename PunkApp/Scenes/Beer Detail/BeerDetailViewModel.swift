//
//  BeerDetailViewModel.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation

class BeerDetailViewModel: ObservableObject {
    
    @Published private(set) var beer: Beer?

    func setUpViewModel(with beer: Beer) {
        self.beer = beer
    }
}
