//
//  NoResultView.swift
//  PunkApp
//
//  Created by David on 8/10/21.
//

import SwiftUI

struct NoResultView: View {
    var body: some View {
        VStack {
            Image("beers")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
            
            Text("no_results".localized)
                .font(.title)
                .foregroundColor(Color.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct NoResultView_Previews: PreviewProvider {
    static var previews: some View {
        NoResultView()
    }
}
