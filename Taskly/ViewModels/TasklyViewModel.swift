//
//  TasklyViewModel.swift
//  Taskly
//
//  Created by David  Lourenço on 09/06/2024.
//

import Foundation
import SwiftUI
import Combine

class TasklyViewModel : ObservableObject{
    
    @Published var tasks : [Task] = []
    @Published var searchBarQuery : String = ""
    @Published var isSheetPresented : Bool = false
    @Published var taskContent : String = ""
    
    let tasksCrudService : CoreDataTasklyService
    
    private var cancellables: Set<AnyCancellable> = []
    
    
    init(coreDataTasklyService: CoreDataTasklyService = CoreDataTasklyService()) {
        self.tasksCrudService = coreDataTasklyService
    }

    
    func deleteSearchBarQuery(){
        
        self.searchBarQuery = ""
        
    }
    
    func toggleIsSheetPresented(){
        
        self.isSheetPresented.toggle()
        
    }
    
    func fetchTasks(){
        
        self.tasksCrudService.fetchTasks()
            .receive(on: DispatchQueue.main)
            .sink{ completion in
                
                switch completion{
                    
                case .finished:
                    print("Successful fetch!")
                case .failure(let error):
                    print("Failed to fetch Tasks with error: \(error)")
                    
                }
    
            } receiveValue: {  [weak self] tasks in
                
                
                self?.tasks = tasks
            

                
            }.store(in: &cancellables)
        
    }
    
    func addTask(){
  
        self.tasksCrudService.addTask(taskDueDate: Date(), taskTitle: self.taskContent)
        
        self.fetchTasks()
        
    }
    
    func removeTask(taskId: UUID){
        
        self.tasksCrudService.deleteTask(taskId: taskId)
        
        self.fetchTasks()
        
        
    }
    
    func updateTask(updatedTask: Task){
        
        self.tasksCrudService.updateTask(updatedTask: updatedTask)
        
        self.fetchTasks()
    }
    
    
    
}
