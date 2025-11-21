//
//  ProductDto.swift
//  EasyStore
//
//  Created by Jorge Mayta on 13/11/25.
//

struct ProductDto: Decodable {
    let id: Int
    let title: String
    let posterPath: String
    let rating: Double
    let price: Double
    let stock: Int
    let tags: [String]
    let description: String
    let brand: String?

    
    enum CodingKeys: String, CodingKey {
        case id, title, rating, price, stock, tags, description, brand
        case posterPath = "thumbnail"
    }
}

nonisolated struct ProductsWrapperDto: Decodable {
    let products: [ProductDto]
}

extension ProductDto {
    
    func toDomain() ->  Product {
        Product(id: id, title: title, posterPath: posterPath)
    }
}
