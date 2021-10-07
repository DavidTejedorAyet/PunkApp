//
//  MainSceneViewModel.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation



class MainSceneViewModel: ObservableObject {
    
    var router: RouteToBeerList & RouteToRandomBeer
    
    init(router: RouteToBeerList & RouteToRandomBeer = Router()) {
        self.router = router
    }
}
