//
//  FavoriteListView.swift
//  EasyMeal
//
//  Created by Jorge Mayta on 6/11/25.
//

import SwiftUI

struct FavoriteListView: View {
    @StateObject var viewModel = FavoriteListViewModel()
    var body: some View {
        List {
            ForEach(viewModel.meals) { meal in
                MealCard(meal: meal)
                    .swipeActions {
                        Button(role: .destructive) {
                            viewModel.deleteFavorite(meal: meal)
                        } label: {
                            Label("Remove", systemImage: "trash")
                        }

                    }
            }
        }
        .onAppear {
            viewModel.getAllFavorites()
        }
    }
}
