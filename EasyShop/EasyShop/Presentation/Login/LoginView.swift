//
//  LoginView.swift
//  EasyShop
//
//  Created by Jorge Mayta on 25/09/25.
//

import SwiftUI

struct LoginView: View {
    
    @State var username = ""
    @State var password = ""
    @State var isVisible = false
    
    var body: some View {
        VStack (spacing: 16) {
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.gray)
                TextField("Username", text: $username)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
            }
            .padding()
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.gray)
                
                Group {
                    if (isVisible) {
                        TextField("Password", text: $password)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                    } else {
                        SecureField("Password", text: $password)
                    }
                }
                
                
                Button(action: {
                    isVisible.toggle()
                }) {
                    Image(systemName: isVisible ? "eye" : "eye.slash")
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.gray)
                }
                
                
            }
            .padding()
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Button(action: {}) {
                
                NavigationLink(destination: {
                    MainView()
                }) {
                    Text("Sign in")
                        .padding()
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .background(.green)
                        .foregroundStyle(.background)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                
            }
            
            
            
        }
        .padding(.horizontal).navigationBarBackButtonHidden()
    }
}

#Preview {
    LoginView()
}
