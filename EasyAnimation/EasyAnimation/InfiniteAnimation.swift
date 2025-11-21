//
//  InfiniteAnimation.swift
//  EasyAnimation
//
//  Created by Jorge Mayta on 20/11/25.
//

import SwiftUI

struct InfiniteAnimation: View {
    @State private var rotate = false
    
    var body: some View {
        Image(systemName: "arrow.2.circlepath")
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
            .rotationEffect(.degrees(rotate ? 360 : 0))
            .animation(.linear(duration: 1).repeatForever(
                autoreverses: false
            ), value: rotate)
            .onAppear {
                rotate.toggle()
            }
            
    }
}

#Preview {
    InfiniteAnimation()
}
