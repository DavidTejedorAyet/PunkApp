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
            List(self.viewModel.beerList) { beer in
                ZStack {
                    NavigationLink(destination: viewModel.router.routeToBeerDetail(with: beer)) {
                        EmptyView() //Para eliminar el icono > de las celdas
                    }
                    BeerItemListView(viewModel: BeerItemListViewModel(beer: beer))

                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)

            }
            .navigationBarTitle("BEER")
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
