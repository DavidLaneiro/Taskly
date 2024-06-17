//
//  TasklyCreateTask.swift
//  Taskly
//
//  Created by David Lourenço on 10/06/2024.
//

import SwiftUI

struct TasklyCreateTask: View {
    
    @ObservedObject var tasklyViewModel: TasklyViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            TasklyCustomColors.lighterOrange.ignoresSafeArea()
        
            TasklyAddEditList(tasklyViewModel: self.tasklyViewModel, isEdit: false)
                .scrollContentBackground(.hidden)
                .scrollIndicators(.hidden)
                .listRowSpacing(10)
        }
        .gesture(
            DragGesture().onEnded { value in
                if value.translation.width > 100 {
                    dismiss()
                }
            }
        )
        .onAppear {
            DispatchQueue.main.async {
                tasklyViewModel.taskContent = ""
                tasklyViewModel.toggleState = false
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Text("Cancel")
                        .foregroundStyle(TasklyCustomColors.customYellow)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
            }
            
            ToolbarItem(placement: .principal) {
                Text("Add task")
                    .foregroundStyle(TasklyCustomColors.customYellow)
                    .bold()
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    // Add save functionality here
                    self.tasklyViewModel.taskContent = self.tasklyViewModel.trimmedTaskContent
                    self.tasklyViewModel.addTask()
                    
                    dismiss()
                }) {
                    Text("Create")
                        .foregroundStyle(TasklyCustomColors.darkerOrange)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .background(
                            RoundedRectangle(cornerRadius: 30.0)
                                .fill(TasklyCustomColors.customYellow)
                                .frame(height: 30)
                        )
                        .opacity(self.tasklyViewModel.trimmedTaskContent.isEmpty ? 0.6 : 1.0)
                }
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                .disabled(self.tasklyViewModel.trimmedTaskContent.isEmpty)
            }
        }
        .toolbarBackground(TasklyCustomColors.lighterOrange, for: .navigationBar)
    }
}

#Preview {
    TasklyCreateTask(tasklyViewModel: TasklyViewModel())
}
