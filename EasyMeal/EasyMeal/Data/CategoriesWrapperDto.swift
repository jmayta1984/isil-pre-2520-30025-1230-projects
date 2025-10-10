//
//  CategoriesWrapperDto.swift
//  EasyMeal
//
//  Created by Jorge Mayta on 9/10/25.
//

struct CategoriesWrapperDto: Decodable {
    let categories: [CategoryDto]
    
    enum CodingKeys: String, CodingKey {
        case categories
    }
}


struct CategoryDto: Decodable {
    let id: String
    let name: String
    let posterPath: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case posterPath = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
}
