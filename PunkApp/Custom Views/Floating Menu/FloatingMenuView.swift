//
//  FloatingMenuView.swift
//  PunkApp
//
//  Created by David on 9/10/21.
//

import SwiftUI

struct FloatingMenuView: View {
    
    @State var showMenuItem1 = false
    @State var showMenuItem2 = false
    
    @State var actionButton1: (() -> Void)?
    @State var actionButton2: (() -> Void)?
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            if showMenuItem2 {
                Color("background").opacity(0.85)
                    .ignoresSafeArea()

                
            } else {
                Color.clear
            }
            
            VStack {
                
                Spacer()
                
                if showMenuItem1 {
                    MenuItemView(image: Image("random_beer"), title: "random".localized)
                        .accessibilityIdentifier("FloatingMenuBtn1")
                        .onTapGesture {
                            actionButton1?()
                            showMenu()
                        }
                }
                    
                
                
                if showMenuItem2 {
                    MenuItemView(image: Image(systemName: "heart.fill"), title: "Test Button")
                        .accessibilityIdentifier("FloatingMenuBtn2")
                        .onTapGesture {
                        actionButton2?()
                        showMenu()
                    }
                }
                
                
                Button {
                    showMenu()
                } label: {
                    ZStack {
                        Circle()
                            .foregroundColor(Color("AccentColor"))
                            .frame(width: 60, height: 60)
                        
                        Image(systemName: "ellipsis")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.white)
                            .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
                    }
                    
                    
                    
                }
                .accessibilityIdentifier("FloatingMenu")
                
                
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        
        
    }
    
    func showMenu() {
        withAnimation {
            showMenuItem2.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            withAnimation {
                self.showMenuItem1.toggle()
            }
        })
    }
}

struct FloatingMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainSceneView()
    }
}
