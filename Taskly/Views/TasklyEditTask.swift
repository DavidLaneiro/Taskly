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
            Color(hex: "FD9B63").ignoresSafeArea()
            
            ScrollView {
                    TasklyCustomTextField(tasklyViewModel: self.tasklyViewModel)
            }
        }
        .onAppear( perform: {
            DispatchQueue.main.async{
                self.tasklyViewModel.taskContent = task.title
            }
        })
        .navigationBarBackButtonHidden(true)
        .toolbar {
        
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Cancel")
                            .foregroundStyle(Color(hex: "FEFFD2"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                }
            
                ToolbarItem(placement: .principal){

                    Text("Edit task")
                        .foregroundStyle(Color(hex: "FEFFD2")).bold()
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
 
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Add save functionality here
                        if self.task.title != self.tasklyViewModel.taskContent{
                            self.tasklyViewModel.updateTaskRowContent(task: task)
                        }
                        
                        dismiss()
                        
                    }) {
                        Text("Save")
                            .foregroundStyle(Color(hex: "FF7D29"))
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                            .background(
                                RoundedRectangle(cornerRadius: 30.0)
                                    .fill(Color(hex: "FEFFD2"))
                                    .frame(height: 30)
                            )
                            .opacity(self.tasklyViewModel.taskContent.isEmpty || self.task.title == self.tasklyViewModel.taskContent  ? 0.6 : 1.0)
                    }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                        .disabled(self.tasklyViewModel.taskContent.isEmpty ? true : false)
                }
        }
    }
}


#Preview {
    TasklyHomePage()
}

