//
//  TaskDetailView.swift
//  ToDo
//
//  Created by Jorge Mayta on 30/10/25.
//

import SwiftUI

struct TaskDetailView: View {
    @State private var title = ""
    var task: Task?
    var cancel: () -> Void
    var save: (Task) -> Void
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Title", text: $title)
                        .autocorrectionDisabled()
                }
            }
            .navigationTitle( task == nil ? "New task" : "Edit task")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        cancel()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        let task = Task(id: self.task?.id ?? UUID(), title: title)
                        save(task)
                    } label: {
                        Image(systemName: "checkmark")
                     
                    }
                }
            }
            .onAppear {
                if let task {
                    title = task.title
                }
            }
        }
        
    }
}


#Preview {
    TaskDetailView { } save: { _ in }

}
