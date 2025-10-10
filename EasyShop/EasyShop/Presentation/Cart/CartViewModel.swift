//
//  CartViewModel.swift
//  EasyShop
//
//  Created by Jorge Mayta on 2/10/25.
//

import Foundation

class CartViewModel: ObservableObject {
    
    @Published private(set) var cartItems: [CartItem] = []
    
    func addCartItem(product: Product, quantity: Int) {
        
        if let index = cartItems.firstIndex(where: { item in
            item.product.id == product.id
        }){
            cartItems[index].quantity += quantity
        }
        else {
            cartItems.append(CartItem(product: product, quantity: quantity))

        }
    }
    
    func removeCartItem(cartItem: CartItem) {
        guard let index = cartItems.firstIndex(where: { item in
            item.product.id == cartItem.product.id
        }) else { return }
        
        cartItems.remove(at: index)
        
    }
    
    func updateCartItemQuantity(product: Product, increase: Bool) {
        
        guard let index = cartItems.firstIndex(where: { item in
            item.product.id == product.id
        }) else { return }
        
        if (increase){
            cartItems[index].quantity += 1
        } else {
            guard cartItems[index].quantity > 1 else { return }
            cartItems[index].quantity -= 1
        }
        
    }
}
