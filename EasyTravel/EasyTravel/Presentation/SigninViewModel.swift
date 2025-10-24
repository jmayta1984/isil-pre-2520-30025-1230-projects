//
//  SigninViewModel.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 23/10/25.
//

import Foundation
import Combine


class SigninViewModel: ObservableObject {
    

    @Published var email = ""
    @Published var password = ""
    
    @Published var message = ""
    @Published var showAlert = false

    
    func signin() {
        let service = AuthService.shared
        
        service.signin(email: email, password: password) { success, message in
            DispatchQueue.main.async {
                self.message = message
                self.showAlert.toggle()
            }
        }
    }
}
