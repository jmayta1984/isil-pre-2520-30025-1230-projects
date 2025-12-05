//
//  CharacterDto.swift
//  RickMorty
//
//  Created by Jorge Mayta on 4/12/25.
//

nonisolated struct CharactersWrapperDto: Decodable {
    let characters: [CharacterDto]
    
    enum CodingKeys: String, CodingKey {
        case characters = "results"
    }
}


struct CharacterDto: Decodable {
    let id: Int
    let name: String
    let species: String
    let image: String
}


extension CharacterDto {
    func toDomain() -> Character {
        Character(id: id, name: name, species: species, image: image)
    }
}
