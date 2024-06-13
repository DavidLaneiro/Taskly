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
            Color(hex: "FD9B63").ignoresSafeArea()
            
            VStack(spacing: -10) {
                // Logo section
                TasklyLogoSection(tasklyViewModel: self.tasklyViewModel)
                
                VStack {
                    // Search bar
                    TasklySearchBar(tasklyViewModel: self.tasklyViewModel)
                    
                    // Filters
                    TasklyFilter(tasklyViewModel: self.tasklyViewModel)
                    
                    content()
                }
                
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    private func content() -> some View {
        if tasklyViewModel.tasks.isEmpty {
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
        } else {
            tasksView()
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
        VStack(spacing: 20) {
            // TasklyLeftTitle(title: "Tasks")
            TasklyList(tasklyViewModel: self.tasklyViewModel)
        }
    }
}

#Preview {
    TasklyHomePage()
}

