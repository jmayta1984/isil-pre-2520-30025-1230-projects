//
//  ProductCard.swift
//  EasyShop
//
//  Created by Jorge Mayta on 18/09/25.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    let product: Product
    var body: some View {
        VStack(alignment: .leading) {
            ZStack (alignment: .topTrailing) {
                
               
                
                AsyncImage(
                    url: URL(string: product.image),
                    content: { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 220)
                            .frame(width: 120)
                        },
                    placeholder: {
                        ProgressView()
                            .frame(height: 220)
                            .frame(width: 120)
                    }
                )
                
                Button {
                    withAnimation {
                        favoritesViewModel.toggleFavorite(product: product)
                    }
                } label: {
                    Image(systemName: favoritesViewModel.favorites.contains(product) ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            }
            .frame(maxWidth: .infinity)
            
            
            Text(product.name)
                .font(.headline)
                .lineLimit(1)
            Text("$ \(product.price, specifier: "%.2f")")
            
        }
        
        .padding()
        .frame(maxWidth: .infinity)
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        
        
    }
}

