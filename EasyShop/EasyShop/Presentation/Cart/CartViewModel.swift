//
//  CartViewModel.swift
//  EasyShop
//
//  Created by Jorge Mayta on 2/10/25.
//

import Foundation

class CartViewModel: ObservableObject {
    
    @Published private(set) var cartItems: [CartItem] = items
    
    func addCartItem(product: Product, quantity: Int) {
        cartItems.append(CartItem(product: product, quantity: quantity))
    }
    
    func removeCartItem(cartItem: CartItem) {
        guard let index = cartItems.firstIndex(where: { item in
            item.product.name == cartItem.product.name
        }) else { return }
        
        cartItems.remove(at: index)
        
    }
    
    func updateCartItemQuantity(product: Product, increase: Bool) {
        
        guard let index = cartItems.firstIndex(where: { item in
            item.product.name == product.name
        }) else { return }
        
        if (increase){
            cartItems[index].quantity += 1
        } else {
            guard cartItems[index].quantity > 1 else { return }
            cartItems[index].quantity -= 1
        }
        
    }
}
