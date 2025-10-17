//
//  CategoryListViewModel.swift
//  EasyMeal
//
//  Created by Jorge Mayta on 10/10/25.
//
import Combine
import Foundation

@MainActor
class CategoryListViewModel: ObservableObject {
    
    @Published var categories: [Category] = []
    
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
