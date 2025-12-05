//
//  CharactersView.swift
//  RickMorty
//
//  Created by Jorge Mayta on 4/12/25.
//

import SwiftUI

struct CharactersView: View {
    
    @StateObject var viewModel = CharactersViewModel()
    @State var query = ""
    var body: some View {
        List {
            Section {
                TextField("Search", text: $query)
                    .onSubmit {
                        viewModel.searchCharacters(query: query)
                    }
            }
            
            switch viewModel.uiState.status {
            case .initial:
                EmptyView()
            case .loading:
                ProgressView()

            case .success:
                CharacterGrid(characters: viewModel.uiState.characters)
            case .failure:
                Text(viewModel.uiState.message ?? "Unknown error")
            }
        }
        
    }
}
