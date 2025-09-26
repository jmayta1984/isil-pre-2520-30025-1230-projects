//
//  HomeView.swift
//  EasyShop
//
//  Created by Jorge Mayta on 11/09/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var selectedProduct: Product? = nil
    
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
                    .shadow(radius: 4)
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 8, trailing: 16))
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .frame(width: 40, height: 40)
                TextField("Search", text: .constant("") ).padding(.vertical)
                
            }
            .overlay{
                RoundedRectangle(cornerRadius: 16).stroke(.green, lineWidth: 2)
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            .shadow(radius: 4)

            
            ScrollView {
                VStack {
                    HStack{
                        
                        VStack {
                            
                            Text("Special offers for you")
                                .font(.title)
                                .foregroundStyle(.white)
                                .bold()
                                .padding(.horizontal)
                            Button(action: {}) {
                                Text("Shop now")
                                    .padding()
                                    .foregroundStyle(.black)
                                    .background(.yellow,in: RoundedRectangle(cornerRadius: 16))
                            }
                        }
                        Spacer()
                        Image("dog")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 224)
                        
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 224)
                    .background(.green)
                    .clipShape( RoundedRectangle(cornerRadius: 32))
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    
                    HStack {
                        Text("Products").font(.headline)
                        Spacer()
                        Button(action: {}) {
                            Text("See all")
                                .font(.headline)
                                .tint(.primary)
                        }
                    }
                    .padding()
                    
                
                    LazyVGrid(
                        columns: [
                            GridItem(.flexible(), spacing: 16),
                            GridItem(.flexible(), spacing: 16)
                        ],
                        spacing: 16
                    ) {
                        ForEach(products, id: \.self.price) { product in    
                            ProductCard(product: product)
                                .onTapGesture {
                                    selectedProduct = product
                                }
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
        .background(.gray.opacity(0.1))
        .tint(.green)
        .navigationDestination(item: $selectedProduct) { product in
            ProductDetail(product: product)
        }
    }
}

#Preview {
    HomeView()
}
