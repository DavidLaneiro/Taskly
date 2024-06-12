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
            
            // Custom Gradient
            LinearGradient(colors: [Color(hex: "FF7D29"), Color(hex: "FFBF78")], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            ScrollView{
                
                VStack(spacing: -10){
                    
                    // Logo section
                    TasklyLogoSection(tasklyViewModel: self.tasklyViewModel)
                    
                    VStack{
                        
                        // Search bar
                        TasklySearchBar(tasklyViewModel: self.tasklyViewModel)
                        
                        // "Done" and "In Progress" Filters
                        TasklyFilter()
                        
                        VStack(spacing: 20){
                            
                            if self.tasklyViewModel.tasks.isEmpty{
                                
                                // Title
                                TasklyLeftTitle(title: "Tasks").hidden()
                                
                                // No Data Screen
                                TasklyNoTasks(tasklyViewModel: self.tasklyViewModel)
                                
                            }else{
                                
                                // Title
                                TasklyLeftTitle(title: "Tasks")
                                
                                // List of Tasks
                                TasklyList(tasklyViewModel: self.tasklyViewModel)
                                    
   
                            }
  
                        }
                        
                    }
     
                    Spacer()
                }
            }.scrollIndicators(.hidden)
        }.onAppear(perform: {
            
            self.tasklyViewModel.fetchTasks()
        })
    }
}

#Preview {
    TasklyHomePage()
}

