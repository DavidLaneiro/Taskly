//
//  TasklyCreateTask.swift
//  Taskly
//
//  Created by David  Lourenço on 10/06/2024.
//

import SwiftUI

struct TasklyCreateTask: View {
    
    @ObservedObject var tasklyViewModel : TasklyViewModel
    
    var body: some View {
        ZStack{
            
            // Custom Gradient
            LinearGradient(colors: [Color(hex: "FF7D29"), Color(hex: "FFBF78")], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            ScrollView{
                VStack(spacing: 20){
                    
                    TasklyCancelCreate(tasklyViewModel: self.tasklyViewModel)
                    
                    
                    // Space where the user is going to write his task
                    TextField("", text: self.$tasklyViewModel.taskContent, prompt: Text("Insert your new task here").foregroundStyle(Color(hex: "FEFFD2").opacity(0.5)), axis: .vertical)
                        .textFieldStyle(.plain)
                        .foregroundStyle(Color(hex: "FEFFD2"))
                    
                    
                    
                    
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
            }
        }
    }
}

#Preview {
    TasklyCreateTask(tasklyViewModel: TasklyViewModel())
}


