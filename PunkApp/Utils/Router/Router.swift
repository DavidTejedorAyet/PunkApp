//
//  Router.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import SwiftUI

final class Router {}

//MARK: Beer list

protocol RouteToBeerList {
    func routeToBeerList() -> BeerListView
}

extension Router: RouteToBeerList {
    func routeToBeerList() -> BeerListView {
        BeerListView()
    }
}

//MARK: Random beer

protocol RouteToRandomBeer {
    func routeToRandomBeer() -> RandomBeerView
}

extension Router: RouteToRandomBeer {
    func routeToRandomBeer() -> RandomBeerView {
        RandomBeerView()
    }
}

//MARK: Bear detail

protocol RouteToBeerDetail {
    func routeToBeerDetail(with beer: Beer) -> BeerDetailView
}

extension Router: RouteToBeerDetail {
    func routeToBeerDetail(with beer: Beer) -> BeerDetailView {
        let detailView = BeerDetailView()
        detailView.viewModel.setUpViewModel(with: beer)
        
        return detailView
    }
}
