//
//  CoreDataTasklyService.swift
//  Taskly
//
//  Created by David  Lourenço on 11/06/2024.
//

import Foundation
import CoreData
import Combine

class CoreDataTasklyService {
    
    private let persistenceController : PersistenceController
    
    private let fetchRequest: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
    
    init(persistenceController: PersistenceController = .shared) {
        self.persistenceController = persistenceController
    }
    
    // CRUD Operations
    
    func fetchTasks() -> AnyPublisher<[Task], Error>{
        
        let context = self.persistenceController.container.viewContext
        
        return Future<[Task], Error>{ [weak self] promise in
            do{
                
                let taskEntities = try context.fetch(self?.fetchRequest ?? TaskEntity.fetchRequest())
                
                let tasksFetched = taskEntities.map({
                    
                    Task(entity: $0)
                    
                })
                
                promise(.success(tasksFetched))
                
            }catch{
                
                print("Failed to fetch tasks with error: \(error)")
                promise(.failure(error))

                
            }
       
        }.eraseToAnyPublisher()
        
    }
    
    func addTask(taskDueDate: Date, taskTitle: String){
        
        let context = self.persistenceController.container.viewContext
        let newEntityTask = TaskEntity(context: context)
        
        // Create new task
        newEntityTask.id = UUID()
        newEntityTask.dueDate = taskDueDate
        newEntityTask.isCompleted = false
        newEntityTask.title = taskTitle
        
        self.persistenceController.saveContext()
    }
    
    func deleteTask(taskToDelete: Task){
        let context = self.persistenceController.container.viewContext
        
        if let taskEntity = self.fetchTaskEntity(withID: taskToDelete.id){
            
            // Delete task
            context.delete(taskEntity)
            self.persistenceController.saveContext()
            
        }
 
    }
    
    func updateTask(updatedTask: Task){
        
        if let taskEntity = self.fetchTaskEntity(withID: updatedTask.id){
            
            // Update Task
            taskEntity.dueDate = updatedTask.dueDate
            taskEntity.isCompleted = updatedTask.isCompleted
            taskEntity.title = updatedTask.title

            self.persistenceController.saveContext()
            
        }

    }
    
    private func fetchTaskEntity(withID id: UUID) -> TaskEntity? {
        
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        let context = persistenceController.container.viewContext
        
        return (try? context.fetch(request))?.first
    }
    
    
}
