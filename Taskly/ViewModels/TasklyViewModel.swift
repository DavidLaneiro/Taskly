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
    @Published var taskContent : String = ""
    
    var trimmedTaskContent: String {
        return taskContent.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
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
                self?.filterTasks(searchQuery: newQuery)
                
            }.store(in: &cancellables)
        
    }
    
    fileprivate func setupToggleBindings(){
        
        let mergedPublisher = Publishers.Merge($isCompletedToggled, $isInProgressToggled)
        
        mergedPublisher
            .receive(on: DispatchQueue.main)
            .sink{ _ in
            } receiveValue: { [weak self] _ in
                
                self?.filterTasks()

            }.store(in: &cancellables)
    }
    
    func deleteSearchBarQuery(){
        
        self.searchBarQuery = ""
        
    }

    func toggleCompletion(task: Task){
        
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
            updateTask(updatedTask: tasks[index])
        }
    
        
    }
    
    func updateTaskRowContent(task: Task){
        
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].title = self.taskContent
            updateTask(updatedTask: tasks[index])
        }
        
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
                
                // Note: When some type of filter is active always work
                // with the filteredTasks and mantain the original tasks
                // intact
                
                if (self?.isCompletedToggled ?? false) || (self?.isInProgressToggled ?? false) || !(self?.searchBarQuery.isEmpty ?? true){

                    withAnimation{
                        self?.filteredTasks = tasks
                    }

                }else{

                    withAnimation{
                        self?.tasks = tasks
                        self?.filteredTasks = tasks
                    }


                }
 
            }.store(in: &cancellables)
        
    }
    
    // CRUD Operations
    
    func addTask(){
  
        self.tasksCrudService.addTask(currentTasks: self.tasks, taskDueDate: Date(), taskTitle: self.taskContent)
        
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
        
        self.fetchTasks()
        
        
    }
    
    func moveTask(from source: IndexSet, to destination: Int) {
        
        
        filteredTasks.move(fromOffsets: source, toOffset: destination)
        
        let maxIndex = filteredTasks.count
        
        // Update the order attribute in Core Data
        for (index, _) in filteredTasks.enumerated() {
            
            let newIndex = Int64(maxIndex - index)
            
            filteredTasks[index].order = newIndex
            self.tasksCrudService.updateTaskOrder(updatedTask: filteredTasks[index])
        }
        
        // Fetch tasks to refresh the view
        fetchTasks()
    }
}

#Preview {
    TasklyHomePage()
}
