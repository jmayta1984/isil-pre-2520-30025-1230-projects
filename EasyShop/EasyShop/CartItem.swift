//
//  CartItem.swift
//  EasyShop
//
//  Created by Jorge Mayta on 25/09/25.
//

struct CartItem {
    let product: Product
    let quantity: Int
}

let cartItems: [CartItem] = [
    CartItem(product: products[0], quantity: 5),
    CartItem(product: products[1], quantity: 2),
    CartItem(product: products[2], quantity: 4)
]
