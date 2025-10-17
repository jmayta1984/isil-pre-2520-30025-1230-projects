//
//  MealsWrapperDto.swift
//  EasyMeal
//
//  Created by Jorge Mayta on 16/10/25.
//

import Foundation

nonisolated struct MealsWrapperDto: Decodable {
    let meals: [MealDto]
    
    enum CodingKeys: String, CodingKey {
        case meals
    }
    
}

struct MealDto: Decodable {
    let id: String
    let name: String
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case posterPath = "strMealThumb"
    }
}
