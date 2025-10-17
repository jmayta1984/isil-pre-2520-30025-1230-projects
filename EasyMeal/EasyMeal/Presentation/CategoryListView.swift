//
//  CategoryListView.swift
//  EasyMeal
//
//  Created by Jorge Mayta on 9/10/25.
//

import SwiftUI

struct CategoryListView: View {
    @StateObject var viewModel = CategoryListViewModel()
    @State var selectedCategory: Category?
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(viewModel.categories) { category in
                    CategoryCard(category: category)
                        .onTapGesture{
                            selectedCategory = category
                        }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Categories")
            .navigationDestination(item: $selectedCategory) { category in
                CategoryDetailView(category: category)
            }
        }
    }
}

#Preview {
    CategoryListView()
}
