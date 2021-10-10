//
//  MenuItemView.swift
//  PunkApp
//
//  Created by David on 9/10/21.
//

import SwiftUI

struct MenuItemView: View {
    var image: Image
    var title: String
    
    var body: some View {
        HStack(alignment: .center) {
            
            Text(title)
                .fontWeight(.medium)
                .frame(width: 140, alignment: .trailing)
                .font(.system(size: 22))
                

            ZStack {
                Circle()
                    .foregroundColor(Color("AccentColor"))
                    .frame(width: 50, height: 50)
                image
                    .resizable()
                
                    .foregroundColor(.white)
                    .padding(12)
                
                
                
            }
            .frame(width: 55, height: 55)
            .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
        }
        .frame(width: 55)
        .offset(x: -76)
        .transition(.move(edge: .trailing))

    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MainSceneView()
    }
}
