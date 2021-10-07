//
//  MainSceneView.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import SwiftUI

struct MainSceneView: View {
    
    @ObservedObject var viewModel = MainSceneViewModel()
    
    var body: some View {
        
        ZStack {
            viewModel.router.routeToBeerList()
        }
        
    }
}

struct MainSceneView_Previews: PreviewProvider {
    static var previews: some View {
        MainSceneView()
    }
}
