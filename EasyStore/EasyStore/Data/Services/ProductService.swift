//
//  ProductService.swift
//  EasyStore
//
//  Created by Jorge Mayta on 13/11/25.
//
import Foundation
class ProductService {
    
    static let shared = ProductService()
    
    private init() {}
    
    func getProducts(completion: @escaping (Result<[Product], ApiError>) -> Void)  {
        let endpoint = "https://dummyjson.com/products"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.endpoint))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(.failure(.unknown))
                return
            }
            
            guard let data = data else {
                completion(.failure(.unknown))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.server))
                return
            }
            
            do {
    
                let wrapperDto = try JSONDecoder().decode(ProductsWrapperDto.self, from: data)
                let products = wrapperDto.products.map({ $0.toDomain()})
                completion(.success(products))
            } catch _ {
                completion(.failure(.decoding))
            }
            
        }
        task.resume()
        
        
        
    }
}

enum ApiError: String, Error {
    case endpoint = "Endpoint not valid"
    case network = "Network error"
    case decoding = "Decoding error"
    case server =  "Server error"
    case unknown = "Unknown error"
}
