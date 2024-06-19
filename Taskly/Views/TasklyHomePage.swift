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
        ZStack {
            TasklyCustomColors.lighter.ignoresSafeArea()
            
            VStack(spacing: -10) {
                // Logo section
                TasklyLogoSection(tasklyViewModel: self.tasklyViewModel)
                
                VStack(spacing: self.tasklyViewModel.toggleGroups ? -10 : 10) {
                
                
                    if !self.tasklyViewModel.toggleGroups{
                        
                        // Search bar tasks
                        TasklySearchBar(tasklyViewModel: self.tasklyViewModel, placeholder: "Search for your task")
                        
                        // Filters
                        TasklyFilter(tasklyViewModel: self.tasklyViewModel)
                        
                    }else{
                        
                        // Search bar groups
                        TasklySearchBar(tasklyViewModel: self.tasklyViewModel, placeholder: "Search for your group")
                        
                        
                    }
                
                    
                    content()
                }
                
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    private func content() -> some View {
        if tasklyViewModel.tasks.isEmpty && tasklyViewModel.isAllToggled {
            noTasksView(
                upperImageName: "note.text.badge.plus",
                largerText: "No tasks yet",
                shorterText: "Tap to add your first task!",
                tapEnabled: true
            )
        } else if tasklyViewModel.filteredTasks.isEmpty {
            noTasksView(
                upperImageName: "questionmark.bubble",
                largerText: "No tasks found",
                shorterText: "No results found for your search.",
                tapEnabled: false
            )
        } else if tasklyViewModel.toggleGroups {
            
            withAnimation{
                
                groupsView()
            }
        }else{
            withAnimation{
                tasksView()
            }
        }
    }
    
    @ViewBuilder
    private func noTasksView(upperImageName: String, largerText: String, shorterText: String, tapEnabled: Bool) -> some View {
        Spacer()
        TasklyNoTasks(
            tasklyViewModel: self.tasklyViewModel,
            upperImageName: upperImageName,
            largerText: largerText,
            shorterText: shorterText,
            tapEnabled: tapEnabled
        )
        Spacer()
        Spacer()
    }
    
    @ViewBuilder
    private func tasksView() -> some View {
            TasklyList(tasklyViewModel: self.tasklyViewModel)
    }
    
    @ViewBuilder
    private func groupsView() -> some View {
        TasklyGroupList(tasklyViewModel: self.tasklyViewModel)
    }
}

#Preview {
    TasklyHomePage()
}



