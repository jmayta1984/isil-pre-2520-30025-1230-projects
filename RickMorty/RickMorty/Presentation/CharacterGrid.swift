//
//  CharacterGrid.swift
//  RickMorty
//
//  Created by Jorge Mayta on 4/12/25.
//

import SwiftUI

struct CharacterGrid: View {
    let characters: [Character]
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
            ForEach(characters) { character in
                CharacterItem(character: character)
            }
        }
    }
}
