//
//  Product.swift
//  EasyShop
//
//  Created by Jorge Mayta on 18/09/25.
//

struct Product: Hashable {
    let name: String
    let price: Double
    let image: String
}

let products = [
    
    Product(name: "Chicken", price: 28.99, image: "https://www.pedigree.com/sites/g/files/fnmzdf3076/files/migrate-product-files/images/vcwwacmkjnrwrgegjkly.png"),
    Product(name: "Chicken & Green Pea Recipe", price: 38.99, image: "https://www.pedigree.com/sites/g/files/fnmzdf3076/files/migrate-product-files/images/vcwwacmkjnrwrgegjkly.png"),
    Product(name: "Chicken & Green Pea Recipe", price: 78.99, image: "https://www.pedigree.com/sites/g/files/fnmzdf3076/files/migrate-product-files/images/vcwwacmkjnrwrgegjkly.png"),
    Product(name: "Chicken & Green Pea Recipe", price: 188.99, image: "https://www.pedigree.com/sites/g/files/fnmzdf3076/files/migrate-product-files/images/vcwwacmkjnrwrgegjkly.png"),
    Product(name: "Chicken & Green Pea Recipe", price: 288.99, image: "https://www.pedigree.com/sites/g/files/fnmzdf3076/files/migrate-product-files/images/vcwwacmkjnrwrgegjkly.png")
]
