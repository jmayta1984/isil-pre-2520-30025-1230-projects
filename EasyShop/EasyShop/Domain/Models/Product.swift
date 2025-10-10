//
//  Product.swift
//  EasyShop
//
//  Created by Jorge Mayta on 18/09/25.
//

struct Product: Identifiable, Hashable {
    let id: Int
    let name: String
    let price: Double
    let image: String
}

let products: [Product] = [
    // Perros
    Product(id: 1, name: "Eukanuba Active Adult", price: 72.99,
            image: "https://www.petandtackshop.co.za/cdn/shop/products/Eukanuba-adult-small-breedAdultfrontpack.png?v=1677760627"),
   
    Product(id: 2, name: "Royal Canin Maxi Puppy", price: 42.50,
            image: "https://cdn.royalcanin-weshare-online.io/WWk4a2QBG95Xk-RB59ld/v516/packshot-puppy-maxi-shn17"),
    Product(id: 3, name: "Purina Pro Plan Sensitive Skin", price: 58.99,
            image: "https://purina.com.pe/sites/default/files/styles/webp/public/2023-05/purina-pro-plan-dry-dog-sensitive-skin-raza-mediana.png.webp?itok=nQj1gVMh"),
    Product(id: 4, name: "Pedigree Adult Chicken", price: 28.99,
            image: "https://www.pedigree.com/sites/g/files/fnmzdf3076/files/migrate-product-files/images/vcwwacmkjnrwrgegjkly.png")
]
