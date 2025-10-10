//
//  CategoryListView.swift
//  EasyMeal
//
//  Created by Jorge Mayta on 9/10/25.
//

import SwiftUI

struct CategoryListView: View {
    @State var viewModel = CategoryListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.categories) { category in
                Text(category.name)
            }
        }
    }
}

#Preview {
    CategoryListView()
}
