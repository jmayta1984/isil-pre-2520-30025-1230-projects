//
//  IntroView.swift
//  EasyShop
//
//  Created by Jorge Mayta on 11/09/25.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        VStack {
            Image("background")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: .infinity)
                .clipped()
            
            Button(action: {
                
            }) {
                Text("Create account")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.background)
                    .background(.primary, in: RoundedRectangle(cornerRadius: 24))
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
            Button(action: {
                
            }) {
                Text("Sign in")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.primary)
                    .background(.background, in: RoundedRectangle(cornerRadius: 24))
                    .overlay {
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(.primary, lineWidth: 2)
                    }
                
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
        }
        .background(.gray.opacity(0.1))
        .tint(.green)
        .padding(.bottom, 32)
    }
}

#Preview {
    IntroView()
}
