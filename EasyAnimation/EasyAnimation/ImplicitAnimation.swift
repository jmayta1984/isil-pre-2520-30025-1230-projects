//
//  ContentView.swift
//  EasyAnimation
//
//  Created by Jorge Mayta on 20/11/25.
//

import SwiftUI

struct ImplicitAnimation: View {
    
    @State private var change = false
    
    var body: some View {
        VStack {
           Circle()
                .fill(change ? .blue: .orange)

                .frame(
                    width: change ? 200 : 100,
                    height: change ? 200 : 100
                )
                .offset(x: change ? 100 : 0,
                        y: change ? 100 : 0)
                .animation(.linear(duration: 2), value: change)
                .onTapGesture {
                    change.toggle()
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
