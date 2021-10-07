//
//  BeerItemListView.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import SwiftUI

struct BeerItemListView: View {
    @ObservedObject var viewModel: BeerItemListViewModel
    
    var body: some View {
        ZStack {
            HStack(spacing: 8) {
                
                AsyncImage(url: URL(string: viewModel.beer.imageURL ?? "")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 90)
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 90)
                    case .failure:
                        Image(systemName: "photo")
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90)
                    @unknown default:
                        EmptyView()
                    }
                    
                    
                    Spacer()
                    VStack(alignment: .trailing){
                        Text(viewModel.beer.name ?? "-")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.trailing)
                        
                        Spacer()
                            .frame(height: 20)
                        
                        Text(viewModel.beer.description ?? "-")
                            .fontWeight(.medium)
                            .lineLimit(3)
                            .multilineTextAlignment(.trailing)
                        
                        Spacer()
                        
                        
                    }
                }
                
            }
            .frame(height: 170)
            .padding(24)
            .background(.white)
            .cornerRadius(6)
            .shadow(color: .gray, radius: 10, x: 3, y: 3)
        }
        .padding(.vertical,8)
        
        
    }
}

struct BeerItemListView_Previews: PreviewProvider {
    static var previews: some View {
        BeerListView()
    }
}
