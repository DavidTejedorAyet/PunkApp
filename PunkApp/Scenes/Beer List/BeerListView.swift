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
        ZStack (){
          
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("filter_by_food", text: $viewModel.searchingText)
                        .foregroundColor(.black)
                        .onChange(of: viewModel.searchingText) { text in
                            viewModel.searchBeer(text: text)
                        }
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                
                .frame(height: 45)
                .padding()
                
                if (viewModel.showLoader) {
                    ZStack{
                        ProgressView()
                    }.zIndex(1)
                } else if viewModel.beerList.isEmpty{
                    
                    NoResultView()
                    
                }
                List {
                    ForEach(viewModel.beerList) { beer in
                        ZStack {// ZStack Para eliminar el icono ">" de las celdas
                            NavigationLink(destination: viewModel.router.routeToBeerDetail(with: beer)) {
                            }
                            
                            BeerItemListView(viewModel: BeerItemListViewModel(beer: beer))
                        }
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    
                    if viewModel.beerList.count >= Constants.amountOfItemsPerRequest {
                        VStack {
                            Text("show_more".localized)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity)
                            
                            ProgressView()
                        }
                        .onAppear {
                            viewModel.getMoreBeers()
                        }
                    }
                    
                }
                .listStyle(PlainListStyle())
                
                
            }
            .padding(.top)
            .navigationBarTitle("title".localized, displayMode: .inline)
        }
        
        
        
        .onAppear {
            if viewModel.beerList.isEmpty {
                viewModel.getBeerList()
            }
        }
    }
}

struct BeerListView_Previews: PreviewProvider {
    static var previews: some View {
        MainSceneView()
    }
}
