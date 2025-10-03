//
//  MainView.swift
//  EasyShop
//
//  Created by Jorge Mayta on 11/09/25.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        TabView(selection: $viewModel.selectedTab){
            Tab("Home", systemImage: "house", value: 0) {
                HomeView()
            }
            Tab("Favorites", systemImage: "heart", value: 1) {
                
            }
            Tab("Cart", systemImage: "cart", value: 2) {
                CartView()
            }
            Tab("Profile", systemImage: "person", value: 3) {
                
            }
            
        }
        .tint(.green)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MainView()
        .environmentObject(CartViewModel())
        .environmentObject(MainViewModel())
}

class MainViewModel: ObservableObject {
    @Published var selectedTab = 0
}
