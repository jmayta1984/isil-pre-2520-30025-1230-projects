//
//  ProductListView.swift
//  EasyStore
//
//  Created by Jorge Mayta on 13/11/25.
//

import SwiftUI

struct ProductListView: View {
    @StateObject private var viewModel = ProductListViewModel()
    var body: some View {
        let  state: UiState<[Product]> = viewModel.uiState
        VStack {
            switch state.status {
            case .loading:
                ProgressView()
            case .success:
                List {
                    ForEach(state.value) { product in
                        ProductCard(product: product)
                    }
                }
                .listStyle(.plain)
            case .failure:
                Text(state.message ?? "Unknown Error")
            case .initial:
                EmptyView()
            }
        }
        .onAppear {
            viewModel.getAllProducts()
        }
        
            
    }
}

#Preview {
    ProductListView()
}
