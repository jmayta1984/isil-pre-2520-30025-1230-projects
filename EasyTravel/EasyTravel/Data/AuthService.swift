//
//  AuthService.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 23/10/25.
//

import Foundation

class AuthService {
    private init() {}
    
    static let shared = AuthService()
    
    func signup(firstName: String, lastName: String, email: String, password: String,
                completion: @escaping(Bool, String) -> Void
    ) {
        
        let endpoint = "https://travelapi-1071627934947.us-central1.run.app/api/users/register"
        guard let url = URL(string: endpoint) else {
            completion(false, "Error: cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestDto = SignupRequestDto(firstName: firstName, lastName: lastName, email: email, password: password)
        
        do {
            let body = try JSONEncoder().encode(requestDto)
            urlRequest.httpBody = body
        } catch (let jsonError) {
            completion(false, "Error: \(jsonError.localizedDescription)")
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(false, "Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                completion(false, "Error: no data returned from server")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 201 else {
                completion(false, "Error: unexpected status code")
                return
            }
            
            do {
                let responseDto = try JSONDecoder().decode(SignupResponseDto.self, from: data)
                completion(true, "Success: \(responseDto.message)")
                
            } catch (let jsonError) {
                completion(false, "Error: \(jsonError.localizedDescription)")
                return
            }
        }
        
        task.resume()
        
    }
    
    func signin(email: String, password: String,
                completion: @escaping(Bool, String) -> Void
    ) {
        
        let endpoint = "https://travelapi-1071627934947.us-central1.run.app/api/users/login"
        guard let url = URL(string: endpoint) else {
            completion(false, "Error: cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestDto = SigninRequestDto(email: email, password: password)
        
        do {
            let body = try JSONEncoder().encode(requestDto)
            urlRequest.httpBody = body
        } catch (let jsonError) {
            completion(false, "Error: \(jsonError.localizedDescription)")
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(false, "Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                completion(false, "Error: no data returned from server")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(false, "Error: unexpected status code")
                return
            }
            
            do {
                let responseDto = try JSONDecoder().decode(SigninResponseDto.self, from: data)
                completion(true, "Success: \(responseDto.firstName) \(responseDto.lastName)" )
                
            } catch (let jsonError) {
                completion(false, "Error: \(jsonError.localizedDescription)")
                return
            }
        }
        
        task.resume()
        
    }
}
