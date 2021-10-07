//
//  BeerListView.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import SwiftUI

struct BeerListView: View {
    
    @ObservedObject var viewModel = BeerListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.beerList) { beer in
                    ZStack {// Ztack Para eliminar el icono ">" de las celdas
                        NavigationLink(destination: viewModel.router.routeToBeerDetail(with: beer)) {
                        }
                        
                        BeerItemListView(viewModel: BeerItemListViewModel(beer: beer))
                    }
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                
                if viewModel.page > 1 {
                    VStack {
                        Text("show_more".localized)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                        
                        ProgressView()
                    }
                    .onAppear {
                        viewModel.getBeerList()
                    }
                }
                
            }
            .navigationBarTitle("title".localized)
            .listStyle(PlainListStyle())
            
        }
        
        .onAppear {
            self.viewModel.getBeerList()
        }
    }
}

struct BeerListView_Previews: PreviewProvider {
    static var previews: some View {
        BeerListView()
    }
}
