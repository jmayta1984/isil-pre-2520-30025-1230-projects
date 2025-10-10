//
//  FavoritesView.swift
//  EasyShop
//
//  Created by Jorge Mayta on 3/10/25.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var viewModel: FavoritesViewModel
    var body: some View {
        
        VStack {
            List {
                ForEach(viewModel.favorites) { product in
                    FavoriteCard(product: product)
                        .swipeActions(edge: .trailing) {
                            Button (role:.destructive) {
                                viewModel.toggleFavorite(product: product)
                            } label: {
                                Label("Remove", systemImage: "trash")
                            }
                            
                        }
                }
            }
            .listStyle(.plain)
        }
    }
}

struct FavoriteCard: View {
    let product: Product
    
    var body: some View {
        
        HStack {
            AsyncImage(
                url: URL(string: product.image),
                content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 96)
                },
                placeholder: {
                    ProgressView()
                        .frame(width: 48, height: 96)
                }
            )
            VStack(alignment: .leading){
                Text(product.name)
                    .font(.headline)
                    .lineLimit(1)

                Text("$ \(product.price, specifier: "%.2f")")
                    .font(.subheadline)
            }
            .padding(.leading)
        }
    }
}
