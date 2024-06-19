//
//  TasklyList.swift
//  Taskly
//
//  Created by David  Lourenço on 12/06/2024.
//

import Foundation
import SwiftUI

struct TasklyList: View {
    
    @ObservedObject var tasklyViewModel : TasklyViewModel
    
    
    var body: some View {
            List{
                // Title
                
                Section {
                    ForEach(self.tasklyViewModel.filteredTasks){ task in
                        
                            
                        ZStack (alignment: .leading){
                            NavigationLink(destination: TasklyEditTask(task: task, tasklyViewModel: self.tasklyViewModel)) {
                                
                                // Just to remove the chevron
                                    
                            }.opacity(0)
                            
                            TasklyTaskListElement(task: task, tasklyViewModel: self.tasklyViewModel)
                        }.listRowBackground(TasklyCustomColors.customTextColor)
                            
                         
                        
                        
                    }
                    .onMove(perform: { indices, newOffset in
                        withAnimation(.easeInOut){
                            self.tasklyViewModel.moveTask(from: indices, to: newOffset)
                        }
                    
                    })
                    
                }header: {
                    
                    Text("Tasks").foregroundStyle(TasklyCustomColors.customTextColor)
                }
                
                
            }
            .scrollContentBackground(.hidden)
            .scrollIndicators(.hidden)
            .listRowSpacing(10)
        
        
        
    }
    
}

#Preview {
    TasklyHomePage()
}

