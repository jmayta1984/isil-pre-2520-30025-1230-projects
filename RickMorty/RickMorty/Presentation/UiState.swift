//
//  UiState.swift
//  RickMorty
//
//  Created by Jorge Mayta on 4/12/25.
//

struct UiState {
    let status: Status
    let characters: [Character]
    let message: String?
    
    init() {
        status = .initial
        characters = []
        message = nil
    }
    
    init(status: Status, characters: [Character], message: String?) {
        self.status = status
        self.characters = characters
        self.message = message
    }
    
    func copyWith(status: Status? = nil, characters: [Character]? = nil, message: String? = nil) -> UiState {
        UiState(
            status: status ?? self.status,
            characters: characters ?? self.characters,
            message: message ?? self.message
        )
    }
}
