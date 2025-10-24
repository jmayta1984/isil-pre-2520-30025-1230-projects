//
//  SignupView.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 23/10/25.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject var viewModel = SignupViewModel()
    
    
    var body: some View {
        
        VStack (spacing: 16){
            TextField("First name", text: $viewModel.firstName)
                .padding()
                .background(Color(uiColor: .systemGroupedBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
            
            TextField("Last name", text: $viewModel.lastName)
                .padding()
                .background(Color(uiColor: .systemGroupedBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
            
            TextField("Email", text: $viewModel.email)
                .padding()
                .background(Color(uiColor: .systemGroupedBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
            
            TextField("Password", text: $viewModel.password)
                .padding()
                .background(Color(uiColor: .systemGroupedBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
            
            Button {
                viewModel.signup()
            } label: {
                Text("Sign up")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(uiColor: .label))
                    .foregroundStyle(Color(uiColor: .systemBackground))
                    .cornerRadius(16)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding()
        
            }
        

        }
        .alert("Message", isPresented: $viewModel.showAlert) {
            
        } message: {
            Text(viewModel.message)
        }

    }
}

#Preview {
    SignupView()
}
