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
    
    func addTask(task: Task) {
        taskDao.insert(task: task)
        tasks.append(task)
    }
    
    func updateTask(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task
            taskDao.update(task: task)
        }
    }
    
    func deleteTask(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
            taskDao.delete(task: task)
        }
    }
}
