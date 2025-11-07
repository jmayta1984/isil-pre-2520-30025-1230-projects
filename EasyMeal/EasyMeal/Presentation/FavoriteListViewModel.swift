//
//  FavoriteListViewModel.swift
//  EasyMeal
//
//  Created by Jorge Mayta on 6/11/25.
//

import Combine

class FavoriteListViewModel: ObservableObject {
    
    @Published var meals: [Meal] = []
    let mealDao = MealDao.shared
    
    func getAllFavorites() {
        meals = mealDao.fetchAll()
    }
    func deleteFavorite(meal: Meal) {
        mealDao.delete(meal: meal)
        getAllFavorites()
    }
}
