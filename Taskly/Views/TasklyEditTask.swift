//
//  TasklyEditTask.swift
//  Taskly
//
//  Created by David  Lourenço on 15/06/2024.
//

import SwiftUI

struct TasklyEditTask: View {
    
    let task : Task
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var tasklyViewModel: TasklyViewModel
    
    var body: some View {
        ZStack {
            TasklyCustomColors.lighter.ignoresSafeArea()
            
            TasklyAddEditList(tasklyViewModel: self.tasklyViewModel, isEdit: true)
                .scrollContentBackground(.hidden)
                .scrollIndicators(.hidden)
                .listRowSpacing(10)     
        }
        .onAppear( perform: {
            DispatchQueue.main.async{
                self.tasklyViewModel.taskContent = task.title
                self.tasklyViewModel.toggleState = task.isCompleted
            }
        })
        .gesture(
            DragGesture().onEnded { value in
                if value.translation.width > 100 {
                    dismiss()
                }
            }
        )
        .navigationBarBackButtonHidden(true)
        .toolbar {
        
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Cancel")
                            .foregroundStyle(TasklyCustomColors.customTextColor)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                }
            
                ToolbarItem(placement: .principal){

                    Text("Your task")
                        .foregroundStyle(TasklyCustomColors.customTextColor).bold()
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
 
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Add save functionality here
                        if StringUtils.trim(self.task.title) != self.tasklyViewModel.trimmedTaskContent{
                            
                            self.tasklyViewModel.taskContent = self.tasklyViewModel.trimmedTaskContent
                            
                            self.tasklyViewModel.updateTaskRowContent(task: task)
                        }
                        
                        dismiss()
                        
                    }) {
                        Text("Save")
                            .foregroundStyle(TasklyCustomColors.darker)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                            .background(
                                RoundedRectangle(cornerRadius: 30.0)
                                    .fill(TasklyCustomColors.customTextColor)
                                    .frame(height: 30)
                            )
                            .opacity(self.tasklyViewModel.taskContent.isEmpty || self.task.title == self.tasklyViewModel.trimmedTaskContent  ? 0.6 : 1.0)
                    }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                        .disabled(self.tasklyViewModel.trimmedTaskContent.isEmpty || self.task.title == self.tasklyViewModel.trimmedTaskContent ? true : false)
                }
        }.toolbarBackground(TasklyCustomColors.lighter, for: .navigationBar)
    }
}




