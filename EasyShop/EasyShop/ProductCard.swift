//
//  ProductCard.swift
//  EasyShop
//
//  Created by Jorge Mayta on 18/09/25.
//

import SwiftUI

struct ProductCard: View {
    let product: Product
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(
                url: URL(string: product.image),
                content: { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 220)

                       
                },
                placeholder: {
                    ProgressView()
                        .frame(height: 220)

                        .frame(maxWidth: .infinity)
                }
            
            )
            
        
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

#Preview {
    ProductCard(product: products[0])
}
