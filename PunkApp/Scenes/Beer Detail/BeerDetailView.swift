//
//  BeerDetailView.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import SwiftUI

struct BeerDetailView: View {
    
    @ObservedObject var viewModel = BeerDetailViewModel()
    
    var body: some View {
        
        ZStack {
            if (viewModel.showLoader) {
                ZStack{
                    Color("background")
                    ProgressView()
                }.zIndex(1)
            }
            
            
            ScrollView {
                ZStack {
                    Color("background")
                    
                    VStack{
                        Color("background")
                            .frame(height: 280)
                        Color.white
                            .cornerRadius(60, corners: [.topRight])
                    }
                    
                    VStack {
                        
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text(viewModel.beer?.name ?? "name")
                                    .font(.system(size: 38))
                                    .fontWeight(.black)
                                    .foregroundColor(Color.white)
                                    .lineLimit(2)
                                
                                Text(viewModel.beer?.tagline ?? "tag")
                                    .font(.system(size: 24))
                                    .fontWeight(.light)
                                    .foregroundColor(Color.white)
                                
                                Spacer()
                                
                                HStack {
                                    Text("\("since".localized) \(viewModel.beer?.firstBrewed ?? "00/00"),")
                                        .font(.system(size: 20))
                                        .fontWeight(.light)
                                        .foregroundColor(Color("AccentColor"))
                                    
                                    Text(String(format: "%.1fº", viewModel.beer?.abv ?? 0.0))
                                        .font(.system(size: 20))
                                        .fontWeight(.light)
                                        .foregroundColor(Color("AccentColor"))
                                }
                                
                                
                            }.frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()
                            AsyncImage(url: URL(string: viewModel.beer?.imageURL ?? "https://images.punkapi.com/v2/214.png")) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 100, height: 265)
                                case .success(let image):
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 265)
                                case .failure:
                                    Image(systemName: "photo")
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 90)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        }
                        .padding(20)
                        .padding(.top, 120)
                        .frame(height: 370)
                        .frame(maxWidth: .infinity)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("description".localized)
                                .font(.title2)
                                .fontWeight(.medium)
                                .underline(true, color: Color("AccentColor"))
                            
                            Text(viewModel.beer?.description ?? "description")
                            
                            Text("good_with_food".localized)
                                .font(.title2)
                                .fontWeight(.medium)
                                .underline(true, color: Color("AccentColor"))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                ForEach(viewModel.beer?.foodPairing ?? ["food","food"], id: \.self) { food in
                                    Text("- \(food)")
                                }
                            }
                            
                        }
                        .padding(.horizontal)
                        .padding(.top, -28)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    
                    
                }
            }
            
        }
        .ignoresSafeArea()
        .onAppear {
            if viewModel.isRandomBeer {
                viewModel.getRandomBeer()
            }
        }
        
    }
    
}

struct BeerDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        BeerDetailView()
    }
}
