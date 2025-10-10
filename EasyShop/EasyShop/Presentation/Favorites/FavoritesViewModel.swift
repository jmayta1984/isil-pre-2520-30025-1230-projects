//
//  FavoritesViewModel.swift
//  EasyShop
//
//  Created by Jorge Mayta on 3/10/25.
//


import Foundation

class FavoritesViewModel: ObservableObject {
    @Published var favorites: [Product] = []
    
    func toggleFavorite(product: Product) {
        if let index = favorites.firstIndex(of: product) {
            favorites.remove(at: index)
        } else {
            favorites.append(product)
        }
    }
}
