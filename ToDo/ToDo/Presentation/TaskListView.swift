//
//  TaskListView.swift
//  ToDo
//
//  Created by Jorge Mayta on 30/10/25.
//

import SwiftUI

struct TaskListView: View {
    
    @StateObject var viewModel = TaskListViewModel()
    
    @State var showDetail = false
    
    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            List {
                ForEach(viewModel.tasks) { task in
                    Text(task.title)
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                viewModel.deleteTask(task: task)
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }
                        }
                }
            }
            Button {
                showDetail.toggle()
                //viewModel.addTask(task: "New task")
            } label: {
                Image(systemName: "plus")
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
        .sheet(isPresented: $showDetail) {
            TaskDetailView { title in
                viewModel.addTask(title: title)
                showDetail.toggle()
            }
        }
        
    }
}

#Preview {
    TaskListView()
}
