//
//  HomeView.swift
//  EasyShop
//
//  Created by Jorge Mayta on 11/09/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            
            HStack{
                VStack(alignment: .leading) {
                    Text("Miraflores").font(.headline)
                    Text("Peru").font(.subheadline)
                }
                Spacer()
                Image(systemName: "bell")
                    .frame(width: 40, height: 40)
                    .background(.background, in: Circle())
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 8, trailing: 16))
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .frame(width: 40, height: 40)
                TextField("Search", text: .constant("") )
                
            }
            .overlay{
                RoundedRectangle(cornerRadius: 16).stroke(.green, lineWidth: 2)
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            
            
            HStack{
                Image("banner")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 92, height: 256)
                
                Spacer()
                VStack {
                    
                    Button(action: {}) {
                        Text("Shop now")
                            .padding()
                            .foregroundStyle(.black)
                            .background(.yellow,in: RoundedRectangle(cornerRadius: 16))
                    }
                }
                Spacer()
                Image("banner")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 92, height: 256)
            
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 192)
            .background(.green)
            .clipShape( RoundedRectangle(cornerRadius: 32))
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            
            Spacer()
            
            
            
        }
        .background(.gray.opacity(0.1))
    }
}

#Preview {
    HomeView()
}
