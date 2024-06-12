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
                    TasklyFilter()
                    
                    if self.tasklyViewModel.tasks.isEmpty{
                        
                        // No Data Screen
                        Spacer()
                        TasklyNoTasks(tasklyViewModel: self.tasklyViewModel)
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
        .onAppear(perform: {
            
            self.tasklyViewModel.fetchTasks()
        })
    }
}

#Preview {
    TasklyHomePage()
}

