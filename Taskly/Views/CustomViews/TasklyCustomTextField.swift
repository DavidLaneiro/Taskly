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
            RoundedRectangle(cornerRadius: 20.0)
                .fill(TasklyCustomColors.customYellow)
                .frame(height: 200)
            
            TextField("", text: $tasklyViewModel.taskContent, prompt: Text("Insert your task here")
                .foregroundStyle(TasklyCustomColors.lighterOrange
                    .opacity(0.5)
                ), axis: .vertical)
            .padding(20)
            .textFieldStyle(.plain)
            .focused(self.$isTextfieldFocused)
            .background(
                RoundedRectangle(cornerRadius: 20.0)
                    .fill(TasklyCustomColors.customYellow)
                
            )
            .foregroundStyle(TasklyCustomColors.darkerOrange)
            .font(.system(size: 18, weight: .bold))
            
            
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
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
    }
    
}
