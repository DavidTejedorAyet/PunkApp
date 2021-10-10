//
//  MainSceneViewModel.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation



class MainSceneViewModel: ObservableObject {
    
    var router: RouteToBeerList & RouteToBeerDetail
    
    init(router: RouteToBeerList & RouteToBeerDetail = Router()) {
        self.router = router
    }
}
