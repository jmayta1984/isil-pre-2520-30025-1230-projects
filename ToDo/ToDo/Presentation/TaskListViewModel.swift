//
//  TaskListViewModel.swift
//  ToDo
//
//  Created by Jorge Mayta on 30/10/25.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var tasks = [Task]()
    
    let taskDao = TaskDao.shared
    
    init() {
        fetchTasks()
    }
    
    func fetchTasks() {
        tasks = taskDao.fetchAll()
    }
    
    func addTask(title: String) {
        let task = Task(id: UUID(), title: title)
        taskDao.insert(task: task)
        fetchTasks()
    }
    
    func updateTask() {
        
    }
    
    func deleteTask(task: Task) {
        taskDao.delete(task: task)
        fetchTasks()
    }
}
