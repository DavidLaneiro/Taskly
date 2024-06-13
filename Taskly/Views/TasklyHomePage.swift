//
//  TasklyHomePage.swift
//  Taskly
//
//  Created by David  Lourenço on 08/06/2024.
//

import SwiftUI

struct TasklyHomePage: View {
    
    @StateObject private var tasklyViewModel = TasklyViewModel()
    
    var body: some View {
        ZStack{
            
            Color(hex: "FD9B63").ignoresSafeArea()
            
            VStack(spacing: -10){
                
                // Logo section
                TasklyLogoSection(tasklyViewModel: self.tasklyViewModel)
                
                VStack{
                    
                    // Search bar
                    TasklySearchBar(tasklyViewModel: self.tasklyViewModel)
                    
                    // "Done" and "In Progress" Filters
                    TasklyFilter(tasklyViewModel: self.tasklyViewModel)
                    
                    if self.tasklyViewModel.tasks.isEmpty{
                        
                        // No Data Screen
                        Spacer()
                        TasklyNoTasks(tasklyViewModel: self.tasklyViewModel, upperImageName: "note.text.badge.plus", largerText: "No tasks yet", shorterText: "Tap to add your first task!", tapEnabled: true)
                        Spacer()
                        Spacer()
                        
                    }else if self.tasklyViewModel.filteredTasks.isEmpty{
                        
                        // No results screen
                        Spacer()
                        TasklyNoTasks(tasklyViewModel: self.tasklyViewModel, upperImageName: "questionmark.bubble", largerText: "No tasks found", shorterText: "No results found for your search.", tapEnabled: false
)
                        Spacer()
                        Spacer()
                        
                    }else{
                
                        VStack(spacing: 20){
                            TasklyLeftTitle(title: "Tasks")
                            TasklyList(tasklyViewModel: self.tasklyViewModel)
                        }

                        
                    }
                }
                
                Spacer()
            }
            
        }
       
    }
}

#Preview {
    TasklyHomePage()
}

