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
    @Published var filteredTasks : [Task] = []
    
    @Published var searchBarQuery : String = ""
    @Published var isSheetPresented : Bool = false
    @Published var taskContent : String = ""
    
    @Published var isAllToggled : Bool = true
    @Published var isCompletedToggled : Bool = false
    @Published var isInProgressToggled : Bool = false
    
    let tasksCrudService : CoreDataTasklyService
    
    private var cancellables: Set<AnyCancellable> = []
    
    
    init(coreDataTasklyService: CoreDataTasklyService = CoreDataTasklyService()) {
        self.tasksCrudService = coreDataTasklyService
        self.setupSearchBarBinding()
        self.setupToggleBindings()
        
    }

    fileprivate func setupSearchBarBinding(){
        
        self.$searchBarQuery
            .receive(on: DispatchQueue.main)
            .sink{ _ in
            } receiveValue: { [weak self] newQuery in
                
                // Filter results with newQuery
                print("New query -> \(newQuery)")
                self?.filterTasks(searchQuery: newQuery)
                
            }.store(in: &cancellables)
        
    }
    
    fileprivate func setupToggleBindings(){
        
        let mergePublisher = Publishers.Merge($isCompletedToggled, $isInProgressToggled)
        
        mergePublisher
            .receive(on: DispatchQueue.main)
            .sink{ _ in
            } receiveValue: { [weak self] newValue in
                
                self?.filterTasks()
                
                
            }.store(in: &cancellables)
    }
    
    func deleteSearchBarQuery(){
        
        self.searchBarQuery = ""
        
    }
    
    func toggleIsSheetPresented(){
        
        self.isSheetPresented.toggle()
        
    }
    
    func toggleCompletion(task: Task){
        
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
            updateTask(updatedTask: tasks[index])
        }
    
        
    }
    
    func fetchTasks(isFilter: Bool = false){
        
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
                
                if isFilter{
                    
                    self?.filteredTasks = tasks
                    
                }else{
                
                    
                    if self?.isCompletedToggled ?? false || self?.isInProgressToggled ?? false{
                        
                        self?.filteredTasks = tasks
                    }else{
                        self?.tasks = tasks
                        self?.filteredTasks = tasks
                    }
                    
                    
                }
 
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
    
    func filterTasks(searchQuery: String = "") {
        
        self.tasksCrudService.filterTasks(searchQuery: searchQuery, isCompleted: self.isCompletedToggled, isInProgress: self.isInProgressToggled)
        
        if self.isAllToggled && searchQuery.isEmpty{
            self.fetchTasks(isFilter: false)
        }else{
            self.fetchTasks(isFilter: true)
        }
        
        
    }
    

    
    
    
}
