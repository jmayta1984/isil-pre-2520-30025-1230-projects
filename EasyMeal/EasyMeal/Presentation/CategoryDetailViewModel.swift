//
//  CategoryDetailViewModel.swift
//  EasyMeal
//
//  Created by Jorge Mayta on 16/10/25.
//


import Foundation
import Combine

@MainActor
class CategoryDetailViewModel: ObservableObject {
    
    @Published var meals: [Meal] = []
    
    func getMealsByCategory(category: String){
        let service = MealService.shared
        
        service.getMealsByCategory(category: category) { meals, error in
            DispatchQueue.main.async {
                if let meals = meals {
                    self.meals = meals
                }
            }
        }
    }
}
