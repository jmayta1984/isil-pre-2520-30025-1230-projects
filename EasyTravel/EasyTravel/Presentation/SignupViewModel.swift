//
//  SignupViewModel.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 23/10/25.
//

import Foundation
import Combine


class SignupViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var password = ""
    
    @Published var message = ""
    @Published var showAlert = false

    
    func signup() {
        let service = AuthService.shared
        
        service.signup(firstName: firstName, lastName: lastName, email: email, password: password) { success, message in
            DispatchQueue.main.async {
                self.message = message
                self.showAlert.toggle()
            }
        }
    }
}
