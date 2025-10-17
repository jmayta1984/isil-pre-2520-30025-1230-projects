//
//  CategoryService.swift
//  EasyMeal
//
//  Created by Jorge Mayta on 9/10/25.
//

import Foundation

class CategoryService {
    
    static let shared = CategoryService()
    
    private init() {}
    
    func getCategories(completion: @escaping ([Category]?, String?) -> Void) {
        let endpoint = "https://www.themealdb.com/api/json/v1/1/categories.php"
        
        guard let url = URL(string: endpoint) else {
            completion(nil,"Error: cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                completion(nil, "Error: \(error?.localizedDescription ?? "Unknown error.")")
                return
            }
            
            guard let data = data else {
                completion(nil, "Error: No data found.")
                return
            }
            
            guard let response =  response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, "Error: Invalid response from API.")
                return
            }
            
            do {
                let categoriesWrapperDto = try JSONDecoder().decode(CategoriesWrapperDto.self, from: data)
                let categories = categoriesWrapperDto.categories.map { categoryDto in
                    Category(
                        id: categoryDto.id,
                        name: categoryDto.name,
                        posterPath: categoryDto.posterPath,
                        overview: categoryDto.overview
                    )
                }
                completion(categories, nil)
                
            } catch (let error) {
                completion(nil, "Error: \(error.localizedDescription)")
            }
            
        }
        
        task.resume()
        
    }
}
