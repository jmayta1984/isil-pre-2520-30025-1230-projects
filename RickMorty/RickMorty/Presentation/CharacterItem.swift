//
//  CharacterItem.swift
//  RickMorty
//
//  Created by Jorge Mayta on 4/12/25.
//

import SwiftUI

struct CharacterItem: View {
    let character: Character
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.image)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFit()
                case .empty:
                    ProgressView()
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 8))

            Text(character.name).lineLimit(1)
            
            Text(character.species)
        }
    }
}
