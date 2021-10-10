//
//  MainSceneView.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import SwiftUI

struct MainSceneView: View {
    
    @ObservedObject var viewModel = MainSceneViewModel()
    
    @State var goToRandom = false
    @State var showAlert = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                NavigationLink(destination: viewModel.router.routeToRandomBeerDetail(), isActive: $goToRandom) { EmptyView() }
                
                viewModel.router.routeToBeerList()
                    
                FloatingMenuView(actionButton1: {
                    goToRandom.toggle()
                }, actionButton2: {
                    
                })
                    
            }
        }
        
        
        
    }
}

struct MainSceneView_Previews: PreviewProvider {
    static var previews: some View {
        MainSceneView()
    }
}
