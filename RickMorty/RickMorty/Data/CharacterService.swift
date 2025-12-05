//
//  CharacterService.swift
//  RickMorty
//
//  Created by Jorge Mayta on 4/12/25.
//

import Foundation

enum ApiError: String, Error {
    case invalidURL = "Invalid URL"
    case noData = "No data"
    case decodingError = "Decoding error"
    case serverError = "Server error"
    case invalidResponse = "Invalid response"
}

class CharacterService {
    static let shared = CharacterService()
    private init() {}
    
    
    func searchCharacters(query: String, completion: @escaping(Result<[Character], ApiError>) -> Void) {
        guard let url = URL(string: "\(ApiConstants.baseUrl)\(ApiConstants.charactersEndpoint)?name=\(query)") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                completion(.failure(.serverError))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let wrapperDto = try JSONDecoder().decode(CharactersWrapperDto.self, from: data)
                let dtos = wrapperDto.characters
                let characters = dtos.map({ $0.toDomain()})
                completion(.success(characters))
                
            } catch {
                completion(.failure(.decodingError))
            }
        }
        
        
        task.resume()
    }
    
    
}
