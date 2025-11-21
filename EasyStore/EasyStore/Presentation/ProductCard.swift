//
//  ProductCard.swift
//  EasyStore
//
//  Created by Jorge Mayta on 13/11/25.
//

import SwiftUI

struct ProductCard: View {
    let product: Product
    
    var body: some View {
        VStack {
            ZStack (alignment: .topTrailing) {
                AsyncImage(url: URL(string: product.posterPath)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                    case .empty:
                        ProgressView()
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 24)
                }
                .buttonStyle(.glass)

            }
            .frame(maxWidth: .infinity)

            

            Text(product.title).font(.headline)
        }
        .frame(maxWidth: .infinity)
    }
}
