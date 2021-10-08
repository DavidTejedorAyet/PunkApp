//
//  MainSceneViewModel.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import Foundation



class MainSceneViewModel: ObservableObject {
    
    var router: RouteToBeerList
    
    init(router: RouteToBeerList = Router()) {
        self.router = router
    }
}
