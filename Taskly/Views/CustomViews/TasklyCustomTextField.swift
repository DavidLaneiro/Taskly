//
//  TasklyCustomTextField.swift
//  Taskly
//
//  Created by David  Lourenço on 15/06/2024.
//

import SwiftUI


struct TasklyCustomTextField: View {
    
    @ObservedObject var tasklyViewModel: TasklyViewModel
    @FocusState private var isTextfieldFocused : Bool
    var isEdit: Bool = false
    
    init(tasklyViewModel: TasklyViewModel, isEdit: Bool) {
        self.tasklyViewModel = tasklyViewModel
        self.isEdit = isEdit
    }
    
    var body: some View {
        
        ZStack(alignment: .topLeading){
            
            TextField("", text: $tasklyViewModel.taskContent, prompt: Text("Insert your task here")
                .foregroundStyle(TasklyCustomColors.lighterOrange
                    .opacity(0.5)
                ), axis: .vertical)
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            .focused(self.$isTextfieldFocused)
            .foregroundStyle(TasklyCustomColors.darkerOrange)
            .font(.system(size: 16, weight: .bold)) 
        }
        .toolbar{
            ToolbarItemGroup(placement: .keyboard){
                Button("Done"){
                    self.isTextfieldFocused = false
                }
                Spacer()
                
            }
        }
        .onTapGesture {
            if !isTextfieldFocused{
                self.isTextfieldFocused = true
            }
        }
        .onAppear(perform: {
            DispatchQueue.main.async {
                if !isEdit{
                    isTextfieldFocused = true
                }
            }
        })
    }
    
}

#Preview {
    TasklyCreateTask(tasklyViewModel: TasklyViewModel())
}
