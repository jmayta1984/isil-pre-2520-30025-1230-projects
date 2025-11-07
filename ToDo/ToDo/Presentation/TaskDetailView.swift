//
//  TaskDetailView.swift
//  ToDo
//
//  Created by Jorge Mayta on 30/10/25.
//

import SwiftUI

struct TaskDetailView: View {
    @State var title = ""
    @State private var headerHeight: CGFloat = 80

    var save: (String) -> Void
    var body: some View {
        ZStack (alignment:.top){
            List {
                Section {
                    TextField("Title", text: $title)
                        .autocorrectionDisabled()
                }
            }
            .safeAreaInset(edge: .top, spacing: 0) {
                         Color.clear.frame(height: headerHeight)
                     }
        
                    
            HStack {
                Button {
                    save(title)
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .tint(Color(uiColor: .label))
                        .padding()
                        .background()
                        .clipShape(Circle())
                        .shadow(radius: 4)
                        .padding(.leading, 16)
                }
                Spacer()
                Button {
                    save(title)
                } label: {
                    Image(systemName: "checkmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .tint(Color(uiColor: .label))
                        .padding()
                        .background()
                        .clipShape(Circle())
                        .shadow(radius: 4)
                        .padding(.trailing, 16)
                }
            }
            .padding(.top)
            
        }
        
    }
}


#Preview {
    TaskDetailView {_ in}
}
