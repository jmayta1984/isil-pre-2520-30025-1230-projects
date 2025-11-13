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
    @State var selectedTask: Task? = nil
    
    var body: some View {
        NavigationStack {
            ZStack (alignment: .bottomTrailing) {
                List {
                    ForEach(viewModel.tasks) { task in
                        HStack {
                            Text(task.title)
                            Spacer()
                            
                        }
                        .background()
                        .onTapGesture {
                            selectedTask = task
                        }
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
            .navigationTitle("To do")
            .sheet(isPresented: $showDetail) {
                TaskDetailView (cancel: {
                    showDetail.toggle()
                }){ task in
                    viewModel.addTask(task: task)
                    showDetail.toggle()
                }
            }
            .sheet(item: $selectedTask) { task in
                TaskDetailView (task: task ,cancel: {
                    selectedTask = nil
                }){ task in
                    viewModel.updateTask(task: task)
                    selectedTask = nil
                }
            }
        }
        
    }
}

#Preview {
    TaskListView()
}
