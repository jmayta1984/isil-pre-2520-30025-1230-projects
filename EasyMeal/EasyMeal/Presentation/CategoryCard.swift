//
//  CategoryCard.swift
//  EasyMeal
//
//  Created by Jorge Mayta on 16/10/25.
//

import SwiftUI

struct CategoryCard: View {
    let category: Category
    var body: some View {
        VStack {
            CategoryImage(url: category.posterPath)
            Text(category.name).font(.title3).bold()
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}


struct CategoryImage: View {
    let url: String
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .frame(height: 200)
        } placeholder: {
            ProgressView()
                .frame(maxWidth: .infinity)
                .frame(height: 200)
        }

        
    }
}
