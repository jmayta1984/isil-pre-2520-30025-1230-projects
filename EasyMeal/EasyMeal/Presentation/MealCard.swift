//
//  MealCard.swift
//  EasyMeal
//
//  Created by Jorge Mayta on 16/10/25.
//

import SwiftUI

struct MealCard: View {
    let meal: Meal
    var body: some View {
        HStack {
            MealImage(url: meal.posterPath)
                .clipShape(Circle())
            
            Text(meal.name).lineLimit(1).padding(.horizontal)
        }
    }
}

struct MealImage: View {
    let url: String
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
        } placeholder: {
            ProgressView()
                .frame(maxWidth: .infinity)
                .frame(width: 48, height: 48)
        }

        
    }
}

