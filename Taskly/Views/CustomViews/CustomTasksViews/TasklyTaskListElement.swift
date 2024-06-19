//
//  TasklyTaskListElement.swift
//  Taskly
//
//  Created by David  Lourenço on 13/06/2024.
//

import Foundation
import SwiftUI

struct TasklyTaskListElement: View {
    
    let task : Task
    @ObservedObject var tasklyViewModel : TasklyViewModel
    
    init(task: Task, tasklyViewModel: TasklyViewModel) {
        self.task = task
        self.tasklyViewModel = tasklyViewModel
    }
    
    var body: some View {
        Button(action: {
            
            print("This is a list element")
            
        }){
            
            HStack(spacing: 20){
                
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(TasklyCustomColors.darker)
                    .onTapGesture(perform: {
                        
                        // Needs to update the variable to True
                        
                        self.tasklyViewModel.toggleCompletion(task: task)
                    })
                
                Text("\(task.title)")
                    .lineLimit(1)
                    .font(.system(size: 16))
                    .bold()
                    .foregroundStyle(TasklyCustomColors.darker)
                    .strikethrough(task.isCompleted ? true : false)
                    .animation(.easeInOut, value: task.isCompleted)
                
                Spacer()
                
                Image(systemName: "star")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(TasklyCustomColors.darker)
                    .onTapGesture(perform: {
                        // Needs favorite logic!!!
                    })
                
            }
            
            
        }
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
        .swipeActions{
            Button(role: .destructive){
                
                self.tasklyViewModel.removeTask(taskId: task.id)
                
                
            } label: {
                
                Label("Delete", systemImage: "trash")
                
            }
        }
        .transition(.opacity)

        
    }
}

#Preview {
    TasklyHomePage()
}
