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
            ForEach(self.tasklyViewModel.tasks){ task in
                
                
                Button(action: {
                    
                    print("This is a list element")
                    
                }){
                    
                    HStack(spacing: 20){
                        
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .frame(width:30, height: 30)
                            .foregroundStyle(Color(hex: "FD9B63"))
                            .onTapGesture(perform: {
                                
                                // Needs to update the variable to True
                                
                                self.tasklyViewModel.updateTask(updatedTask: task)
                            })
                        
                        Text("\(task.title)")
                            .lineLimit(1)
                            .font(.title3)
                            .bold()
                            .foregroundStyle(Color(hex: "FD9B63"))
                    }
                
                }.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    .swipeActions{
                        Button(role: .destructive){
                            
                            self.tasklyViewModel.removeTask(taskId: task.id)
                            
                            
                        } label: {
                            
                            Label("Delete", systemImage: "trash")
                            
                        }
                    }
            }.listRowBackground(
                RoundedRectangle(cornerRadius: 20).foregroundStyle(Color(hex: "FEFFD2"))
            )

        }
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
        .listRowSpacing(20)
        .background(.clear)
        .listStyle(.plain)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        
        
    }
    
}


#Preview {
    TasklyHomePage()
}
