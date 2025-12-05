//
//  CharactersViewModel.swift
//  RickMorty
//
//  Created by Jorge Mayta on 4/12/25.
//

import Combine
import Foundation

class CharactersViewModel: ObservableObject {
    @Published var uiState = UiState()
    let service = CharacterService.shared
    
    func searchCharacters(query: String) {
        
        uiState = uiState.copyWith(status: .loading)
        
        service.searchCharacters(query: query) { result in
            switch result {
            case .success(let characters):
                DispatchQueue.main.async {
                    self.uiState = self.uiState.copyWith(
                        status: .success,
                        characters: characters
                    )
                }
                
            case .failure:
                
                DispatchQueue.main.async {
                    self.uiState = self.uiState.copyWith(status: .failure)

                }
            }
        }
    }
}
