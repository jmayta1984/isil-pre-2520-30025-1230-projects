//
//  CategoryListViewModel.swift
//  EasyMeal
//
//  Created by Jorge Mayta on 10/10/25.
//
import Observation
import CoreFoundation

@Observable
class CategoryListViewModel {
    
    var categories: [Category] = []
    
    func getCategories() {
        let service = CategoryService.shared
        
        service.getCategories { categories, error in
            DispatchQueue.main.async {
                if let categories = categories {
                    self.categories = categories
                }
            }
        }
    }
    
    init() {
        getCategories()
    }
}
