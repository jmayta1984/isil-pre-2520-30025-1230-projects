//
//  MainView.swift
//  EasyMeal
//
//  Created by Jorge Mayta on 6/11/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab {
                CategoryListView()
            
            } label: {
                Label("Home", systemImage: "house")
            }
            Tab {
                FavoriteListView()
            } label: {
                Label("Favorites", systemImage: "heart")
            }

        }
    }
}

#Preview {
    MainView()
}
