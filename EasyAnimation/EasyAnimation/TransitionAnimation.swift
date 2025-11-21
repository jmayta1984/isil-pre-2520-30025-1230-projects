//
//  TransitionAnimation.swift
//  EasyAnimation
//
//  Created by Jorge Mayta on 20/11/25.
//

import SwiftUI

struct TransitionAnimation: View {
    
    @State var show = false
    
    var body: some View {
        VStack {
            if show {
                Rectangle()
                    .fill(.green)
                    .frame(width: 100, height: 100)
                    .transition(.scale)
            }
            
            Button("Show") {
                withAnimation {
                    show.toggle()
                }
            }
        }
    }
}

#Preview {
    TransitionAnimation()
}
