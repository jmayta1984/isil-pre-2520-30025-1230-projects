//
//  CartView.swift
//  EasyShop
//
//  Created by Jorge Mayta on 2/10/25.
//

import SwiftUI

struct CartView: View {
    @StateObject var cartViewModel = CartViewModel()
    var body: some View {
        VStack {
            List {
                ForEach(cartViewModel.cartItems, id: \.product.name){ cartItem in
                    CartItemCard(cartItem: cartItem, onDecrease: {
                        cartViewModel.updateCartItemQuantity(product: cartItem.product, increase: false)
                    }, onIncrease: {
                        cartViewModel.updateCartItemQuantity(product: cartItem.product, increase: true)
                    })
                    .swipeActions(edge: .trailing) {
                        Button (role:.destructive) {
                            cartViewModel.removeCartItem(cartItem: cartItem)
                        } label: {
                            Label("Remove", systemImage: "trash")
                        }

                    }
                }
        
                .listRowSeparator(.hidden)
                
            }
            .listStyle(.plain)
            
            VStack {
                HStack {
                    Text("Total")
                        .font(.headline)
                    Spacer()
                    
                    Text("$ \(cartViewModel.cartItems.reduce(0, { $0 + Double($1.quantity)*$1.product.price }), specifier: "%.2f")")
                        .font(.headline)
                    
                }
                Button(action: {}) {
                    
                    NavigationLink(destination: {
                        MainView()
                    }) {
                        Text("Check out")
                            .padding()
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .background(.green)
                            .foregroundStyle(.background)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    
                }
            }
            .padding()
        }
       
    }
}

#Preview {
    CartView()
}

struct CartItemCard: View {
    let cartItem: CartItem
    let onDecrease: () -> ()
    let onIncrease: () -> ()
    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: cartItem.product.image),
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
            VStack (alignment:.leading){
                Text(cartItem.product.name)
                    .font(.headline)
                Text("$ \(cartItem.product.price, specifier: "%.2f")")
                
            }
            Spacer()
            
            HStack {
                Button(action: onDecrease) {
                    Image(systemName: "minus")
                }
                .buttonStyle(.plain)
                
                Text("\(cartItem.quantity)")
                    .frame(width: 20)
                Button(action: onIncrease) {
                    Image(systemName: "plus")
                }
                .buttonStyle(.plain)
            }
        }
        
        
    }
}



