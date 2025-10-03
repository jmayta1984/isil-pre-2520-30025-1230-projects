//
//  ProductDetail.swift
//  EasyShop
//
//  Created by Jorge Mayta on 18/09/25.
//

import SwiftUI

struct ProductDetail: View {
    let product: Product
        
    @StateObject var viewModel = ProductDetailViewModel()
    
    var body: some View {
        
        ZStack (alignment: .bottom){
            ScrollView {
                VStack(alignment: .leading) {
                    
                    AsyncImage(
                        url: URL(string: product.image),
                        content: { image in
                            image.resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity)
                                .frame(height: 400)
                                .clipped()
                        },
                        placeholder: {
                            ProgressView()
                                .frame(maxWidth: .infinity)
                                .frame(height: 400)
                        })
                    Text(product.name).font(.title2)
                        .padding(.horizontal).bold()
                        .padding(.top)
                    Text("$ \(product.price, specifier: "%.2f")").font(.title2)
                        .padding(.horizontal)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            viewModel.decreaseQuantity()
                        }) {
                            Image(systemName: "minus")
                                .font(.title2)
                                .frame(width: 24, height: 24)
                                .tint(.primary)
                                .padding()
                                .background(.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 16))
                                .clipped()
                        }
                        Text("\(viewModel.quantity)").font(.title2).frame(width: 40)
                        
                        Button(action: {
                            viewModel.increaseQuantity()
                        }) {
                            Image(systemName: "plus")
                                .font(.title2)
                                .frame(width: 24, height: 24)
                                .tint(.primary)
                                .padding()
                                .background(.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 16))
                                .clipped()
                        }
                    }
                    .padding(.trailing)
                }
            }
            
            Button(action: {
                
            }) {
                Text("Add to cart")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.background)
                    .background(.primary, in: RoundedRectangle(cornerRadius: 16))
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
        }
        .background(.gray.opacity(0.1))
        .tint(.green)
        
    }
}



#Preview {
    ProductDetail(product: products[0])
}
