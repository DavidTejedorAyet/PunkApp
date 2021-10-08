//
//  RandomBeerView.swift
//  PunkApp
//
//  Created by David on 7/10/21.
//

import SwiftUI

struct RandomBeerView: View {
    
    @ObservedObject var viewModel = RandomBeerViewModel()

    var body: some View {
        VStack {
            Text(viewModel.beer?.name ?? "nothing")
        }
        .onAppear {
            viewModel.getRandomBeer()
        }
    }
}

struct RandomBeerView_Previews: PreviewProvider {
    static var previews: some View {
        RandomBeerView()
    }
}
