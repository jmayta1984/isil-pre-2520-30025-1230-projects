//
//  ExplicitAnimation.swift
//  EasyAnimation
//
//  Created by Jorge Mayta on 20/11/25.
//

import SwiftUI

struct ExplicitAnimation: View {
    @State private var move = false
    
    var body: some View {
        VStack {
            
            Rectangle()
                .frame(width: 100, height: 100)
                .offset(x: move ? 100 : 0)
            
            Button("Move") {
                withAnimation(.linear(duration: 3)) {
                    move.toggle()
                }
            }
        }
    }
}

#Preview {
    ExplicitAnimation()
}
