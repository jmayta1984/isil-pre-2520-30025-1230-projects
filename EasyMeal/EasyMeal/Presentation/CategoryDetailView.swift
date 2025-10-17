//
//  CategoryDetailView.swift
//  EasyMeal
//
//  Created by Jorge Mayta on 16/10/25.
//

import SwiftUI

struct CategoryDetailView: View {
    let category: Category
    
    @StateObject var viewModel = CategoryDetailViewModel()
    
    var body: some View {
        List {
            Section {
                CategoryImage(url: category.posterPath)
            }
            
            Section {
                VStack (alignment: .leading, spacing: 8) {
                    Text("Description").font(.title3).bold()
                    Text(category.overview)
                }
                
            }
            
            Section {
                VStack (alignment: .leading, spacing: 8) {
                    Text("Meals").font(.title3).bold()
                    ForEach(viewModel.meals) { meal in
                        MealCard(meal: meal)
                            .padding(8)
                    }
                }
                
            }

        }
        
        .navigationTitle(category.name)
        .onAppear {
            viewModel.getMealsByCategory(category: category.name)
        }
    }
}
