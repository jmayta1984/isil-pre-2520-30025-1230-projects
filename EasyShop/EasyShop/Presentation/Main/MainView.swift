//
//  MainView.swift
//  EasyShop
//
//  Created by Jorge Mayta on 11/09/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            Tab("Home", systemImage: "house") {
                HomeView()
            }
            Tab("Favorites", systemImage: "heart") {
                
            }
            Tab("Cart", systemImage: "cart") {
                
            }
            Tab("Profile", systemImage: "person") {
                
            }
            
        }
        .tint(.green)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MainView()
}
